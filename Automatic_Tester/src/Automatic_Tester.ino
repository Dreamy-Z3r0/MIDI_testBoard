#include <Arduino.h>
#include <avr/io.h>
#include <avr/interrupt.h>

/******************************************************************
 *** Macros and variables related to controlling stepper motors ***
 ******************************************************************/
#define STEPPER_TIMER 2

#define STEPPER_MOTORS_DDR DDRC
#define STEPPER_MOTORS     PORTC  // Analog input pins on Arduino board

#define A1_EN   PORTC0    // Arduino A0
#define A1_STEP PORTC1    // Arduino A1
#define A1_DIR  PORTC2    // Arduino A2

#define A2_EN   PORTC3    // Arduino A3
#define A2_STEP PORTC4    // Arduino A4
#define A2_DIR  PORTC5    // Arduino A5

#define MICROSTEPPING_FACTOR 4

double STEPPER_PWM_PERIOD = 0.3;  // milliseconds
double STEPPER_PWM_DUTY = 90.0; // %

bool ROTATION_DIRECTION[] = {true, true}; // true (default) - counter-clockwise rotation; false - clockwise rotation

unsigned int STEPS_TO_TAKE[2] = {0, 0};

unsigned int REMAINING_X_STEPS = 0;
unsigned int REMAINING_Y_STEPS = 0;

float lastPos[2] = {114.0, 114.0};

const float positioning_Array[4][4][2] = {
    {{0,   0}, {38,   0}, {76,   0}, {114,   0}},
    {{0,  38}, {38,  38}, {76,  38}, {114,  38}},
    {{0,  76}, {38,  76}, {76,  76}, {114,  76}},
    {{0, 114}, {38, 114}, {76, 114}, {114, 114}}
};

uint8_t x_index = 0,
        y_index = 0;


/****************************************************************
 *** Macros and variables related to conbtrolling servo motor ***
 ****************************************************************/


/************************************************************
 *** Macros and flags used for commands from START button ***
 ************************************************************/

#define startButton 3 // Arduino hardware input pin number for START button

bool startButtonPressed = false; // Indicates the states of the START button.

bool justStarted = false;          // Indicates the first time START button is pressed in one working cycle.
bool MOTOR_OPERATING_FLAG = false; // Flag for starting a working cycle of motors.

unsigned long StartButton_HeldTime; // Used for managing held time of START button for STOP command.
bool stopCommand = false;           // Stop command is requested by user after START button has been held for some time (3 seconds).

void setup()
{
  Serial.begin(9600);

  // Set pin data direction for stepper-controlling pins
  STEPPER_MOTORS_DDR |= ((1 << A2_DIR) | (1 << A2_STEP) | (1 << A2_EN));
  STEPPER_MOTORS_DDR |= ((1 << A1_DIR) | (1 << A1_STEP) | (1 << A1_EN));

  // Disable stepper motors initially to avoid any unwanted operations.
  STEPPER_MOTORS |= ((1 << A2_EN) | (1 << A1_EN));

  //Set startButton as input
  pinMode(startButton, INPUT);

  // Enable interrrupts for INT1
  attachInterrupt(digitalPinToInterrupt(startButton), startService, FALLING);

  // Initialize Timer 1 for controlling stepper motors.
  Initialization(STEPPER_TIMER, STEPPER_PWM_PERIOD, STEPPER_PWM_PERIOD * (STEPPER_PWM_DUTY / 100.0));
}

void loop()
{
  if (Serial.available())
  {
    byte BUFFER[10];
    Serial.readBytes(BUFFER, 10);

    if ('Y' == BUFFER[0])
    {
      Serial.println("Command: Y");
      if (!MOTOR_OPERATING_FLAG)
      {
        MOTOR_OPERATING_FLAG = true;
        justStarted = true;
        x_index = 0;
        y_index = 0;
      }
    }
    else if ('N' == BUFFER[0])
    {
      Serial.println("Command: N");
      stopCommand = true;
    }
    else Serial.println("Invalid command!");
  }

  if (startButtonPressed)
  {
    if (3000 + StartButton_HeldTime <= 0xFFFFFFFF) // Normal case of timing with millis() function.
    {
      unsigned int currentTime = millis();
      if (currentTime < StartButton_HeldTime) // Case of unexpected overflowed timer counter.
        STOP_command_initialized();
      else if (millis() - StartButton_HeldTime >= 3000) // Normal situation.
        STOP_command_initialized();
    }
    else // Prevent the case of overflowed timer counter.
    {
      if (millis() >= (3000 - (0xFFFFFFFF - StartButton_HeldTime)))
        STOP_command_initialized();
    }
  }

  if (stopCommand)    // STOP command initiated after the START button has been pressed and held for 3 seconds.
  {
    PWM_StartStop(STEPPER_TIMER, false, false);   // Stop both stepper motors immediately.
    get_lastPosition();     // Get last position based on the remaing steps the stepper motors were taking.

    REMAINING_X_STEPS = 0;
    REMAINING_Y_STEPS = 0;

    stopCommand = false;    // Clear STOP command for new working cycles.
    MOTOR_OPERATING_FLAG = false;

    get_lastPosition();
  }

  if ((MOTOR_OPERATING_FLAG) && (x_index < 4) && (y_index < 4))
  {
    TEST_RUN_ROUTINE();

    if ((4 == x_index) && (4 == y_index))
    {
      MOTOR_OPERATING_FLAG = false;
      x_index = 0;
      y_index = 0;
    }
  }

//  if (MOTOR_OPERATING_FLAG)
//  {
//    Serial.print(REMAINING_X_STEPS);
//    Serial.print(",");
//    Serial.println(REMAINING_Y_STEPS);
//  }
}

void startService()
{
  detachInterrupt(digitalPinToInterrupt(startButton));
  startButtonPressed = true;
  StartButton_HeldTime = millis();

  attachInterrupt(digitalPinToInterrupt(startButton), startService, RISING);
}

void buttonReleased()
{
  detachInterrupt(digitalPinToInterrupt(startButton));
  startButtonPressed = false;
  if (!MOTOR_OPERATING_FLAG)
  {
    MOTOR_OPERATING_FLAG = true;
    justStarted = true;
    x_index = 0;
    y_index = 0;
  }
  attachInterrupt(digitalPinToInterrupt(startButton), startService, FALLING);
}

void STOP_command_initialized()
{
  startButtonPressed = false;
  detachInterrupt(digitalPinToInterrupt(startButton));
  stopCommand = true;
  attachInterrupt(digitalPinToInterrupt(startButton), startService, FALLING);
}

void TEST_RUN_ROUTINE()
{
  if (justStarted)    // START command has just been called.
  {
    moveTo(positioning_Array[0][0][0], positioning_Array[0][0][1]);   // Move the cursor to the origin.
  }
  else if ((0 == REMAINING_X_STEPS) && (0 == REMAINING_Y_STEPS))   // The cursor is stationary and ready for the next position.
  {
    delay(300);
    x_index += 1;       // Next position on x-axis.

    if (4 == x_index)   // Cursor has already been to the last position on the x-axis.
    {
      y_index += 1;     // Next row
      if (4 > y_index) x_index = 0;   // If the cursor was not on the last row, it is moved to the beginning of the next row.
    }

    // Move the cursor the next position on the board.
    if ((4 > x_index) || (4 > y_index)) 
      moveTo(positioning_Array[y_index][x_index][0], positioning_Array[y_index][x_index][1]);
  }
}

void moveTo(float des_X1, float des_Y1)
{
  if (!justStarted) get_lastPosition();   // Update the cursor's latest position
  else
  {
    justStarted = false;
    if ((STEPS_TO_TAKE[0] != 0) || (STEPS_TO_TAKE[1] != 0)) get_lastPosition();
  }

  Serial.print("Move to (");
  Serial.print(positioning_Array[y_index][x_index][0]);
  Serial.print(", ");
  Serial.print(positioning_Array[y_index][x_index][1]);
  Serial.print(") from (");

  Serial.print(lastPos[0]);
  Serial.print(", ");
  Serial.print(lastPos[1]);
  Serial.println(")");

  // Calculate the steps to take by each axis
  float DISPLACEMENT_X = des_X1 - lastPos[0];
  float DISPLACEMENT_Y = des_Y1 - lastPos[1];

  DISPLACEMENT_TO_STEPS(DISPLACEMENT_X, &ROTATION_DIRECTION[0], &STEPS_TO_TAKE[0]);
  DISPLACEMENT_TO_STEPS(DISPLACEMENT_Y, &ROTATION_DIRECTION[1], &STEPS_TO_TAKE[1]);

  REMAINING_X_STEPS = STEPS_TO_TAKE[0];
  REMAINING_Y_STEPS = STEPS_TO_TAKE[1];

  Serial.print("   DISPLACEMENT_X = ");
  Serial.print(DISPLACEMENT_X);
  Serial.print(" -> ");
  Serial.print(STEPS_TO_TAKE[0]);
  Serial.println(" steps");

  Serial.print("   DISPLACEMENT_Y = ");
  Serial.print(DISPLACEMENT_Y);
  Serial.print(" -> ");
  Serial.print(STEPS_TO_TAKE[1]);
  Serial.println(" steps");

  /* Run, Barry. Run! */

  // Set rotation direction for motors
  if (ROTATION_DIRECTION[0])
    STEPPER_MOTORS |=  (1 << A1_DIR);
  else
    STEPPER_MOTORS &=  ~(1 << A1_DIR);

  if (ROTATION_DIRECTION[1])
    STEPPER_MOTORS |=  (1 << A2_DIR);
  else
    STEPPER_MOTORS &= ~(1 << A2_DIR);

  // Enable or disable motors
  if (0 < STEPS_TO_TAKE[0])
    STEPPER_MOTORS &= ~(1 << A1_EN);
  else
    STEPPER_MOTORS |= (1 << A1_EN);

  if (0 < STEPS_TO_TAKE[1])
    STEPPER_MOTORS &= ~(1 << A2_EN);
  else
    STEPPER_MOTORS |= (1 << A2_EN);

  // Start outputing Pseudo-PWM control signals
  PWM_StartStop(STEPPER_TIMER, REMAINING_X_STEPS > 0, REMAINING_Y_STEPS > 0);
}

// Update the cursor's latest position
void get_lastPosition()
{
  lastPos[0] += STEPS_TO_DISPLACEMENT(STEPS_TO_TAKE[0] - REMAINING_X_STEPS, ROTATION_DIRECTION[0]);
  lastPos[1] += STEPS_TO_DISPLACEMENT(STEPS_TO_TAKE[1] - REMAINING_Y_STEPS, ROTATION_DIRECTION[1]);

  if ((0 == REMAINING_Y_STEPS) && (0 == REMAINING_X_STEPS))
  {
    save_lastPosition();
  }
}

void save_lastPosition()
{
  // Routine to save latest position to eeprom
}

/*****************************************************
 *** Interchanging steps and physical displacement ***
 *****************************************************/
float STEPS_TO_DISPLACEMENT(unsigned int STEPS, bool ROTATION_DIRECTION)
{
  return ((float)STEPS / ((ROTATION_DIRECTION ? 5.0 : -5.0) * MICROSTEPPING_FACTOR));
}

void DISPLACEMENT_TO_STEPS(float DISPLACEMENT_MM, bool *ROTATION_DIRECTION, unsigned int *STEPS)
{
  *ROTATION_DIRECTION = (DISPLACEMENT_MM >= 0);

  float DISTANCE = (DISPLACEMENT_MM >= 0 ? DISPLACEMENT_MM : -DISPLACEMENT_MM);
  *STEPS = (unsigned int)(DISTANCE * 5.0 * MICROSTEPPING_FACTOR);
  Serial.print("         DISPLACEMENT_MM = ");
  Serial.println(DISPLACEMENT_MM);
  Serial.print("         DISTANCE = ");
  Serial.println(DISTANCE);
  Serial.print("         Rotation direction: ");
  Serial.println(*ROTATION_DIRECTION ? "counter-clockwise" : "clockwise");
  Serial.print("         STEPS = ");
  Serial.println(*STEPS);
}

/*******************************************
 *** Output control signal(s) for motors ***
 *******************************************/
uint8_t STEPPER_BASE_COUNTER_LOW_PERIOD, STEPPER_BASE_COUNTER_HIGH_PERIOD;
bool STEPPER_CURRENT_OUTPUT_VALUE = LOW;

void Initialization(uint8_t TIMER_ID, float PERIOD_MS, float DUTY_CYCLE_MS)    // Called once at boot, or whenever user wants to change control signal.
{
  if (STEPPER_TIMER == TIMER_ID)  // Timer 2 in use
  {
    cli();

    TIMER_COUNTER_COMPARE_VALUE_UPDATE(TIMER_ID, PERIOD_MS, DUTY_CYCLE_MS);

    // Set counter mode: Normal mode
    TCCR2A &= ~((1 << WGM21) | (1 << WGM20));
    TCCR2B &= ~(1 << WGM22);

    // Set initial value for counter register
    TCNT2 = STEPPER_BASE_COUNTER_LOW_PERIOD;

    // Enable overflow interrupt
    TIMSK2 = 1;   // Only enable overflow interrupt
    sei();
  }
}

void PWM_StartStop(uint8_t TIMER_ID, bool CHANNEL_A, bool CHANNEL_B)    // Called when at least a motor's behaviour is changed.
{
  if (STEPPER_TIMER == TIMER_ID)  // Timer 2 in use
  {
    if (!(CHANNEL_A | CHANNEL_B))   // Timer 2 stopped: Disable Pseudo-PWM on both pins A1_STEP and A2_STEP
      TCCR2B &= ~((1 << CS22) | (1 << CS21) | (1 << CS20));
    else    // Timer 2 running: Pseudo-PWM enabled on either pins A1_STEP or A2_STEP, or both pins
    {
      if (0x04 != (TCCR2B & 0x04))  // Precaler = 64
      {
        TCCR2B &=  ~((1 << CS21) | (1 << CS20));
        TCCR2B |=    (1 << CS22);
      }
    }
  }
}

void TIMER_COUNTER_COMPARE_VALUE_UPDATE(uint8_t TIMER_ID, float PERIOD, float DUTY)
{
  if (STEPPER_TIMER == TIMER_ID)  // Timer 2 in use
  {
    STEPPER_BASE_COUNTER_HIGH_PERIOD = (uint8_t)(256 - 250 * DUTY);
    STEPPER_BASE_COUNTER_LOW_PERIOD  = (uint8_t)(256 - 250 * (PERIOD - DUTY));
  }
}

ISR(TIMER2_OVF_vect)
{
  STEPPER_CURRENT_OUTPUT_VALUE = !STEPPER_CURRENT_OUTPUT_VALUE;

  if (STEPPER_CURRENT_OUTPUT_VALUE)
  {
    TCNT2 = STEPPER_BASE_COUNTER_HIGH_PERIOD;

    if ((REMAINING_X_STEPS == 0) && (REMAINING_Y_STEPS == 0))   // Neither motor on x-axis nor motor y-axis has any more steps to run.
    {
      STEPPER_MOTORS &= ~((1 << A1_STEP) | (1 << A2_STEP));
    }
    else if ((REMAINING_X_STEPS == 0) ^ (REMAINING_Y_STEPS == 0))   // Either motor on x-axis or motor y-axis stops.
    {
      if (REMAINING_X_STEPS == 0)   // Motor on x-axis stops
      {
        STEPPER_MOTORS &= ~(1 << A1_STEP);
        STEPPER_MOTORS |=  (1 << A2_STEP);
      }
      else  // Motor on y-axis stops.
      {
        STEPPER_MOTORS &= ~(1 << A2_STEP);
        STEPPER_MOTORS |=  (1 << A1_STEP);
      }
    }
    else
    {
      STEPPER_MOTORS |= ((1 << A1_STEP) | (1 << A2_STEP));
    }
  }
  else
  {
    TCNT2 = STEPPER_BASE_COUNTER_LOW_PERIOD;

    STEPPER_MOTORS &= ~((1 << A1_STEP) | (1 << A2_STEP));

    bool CHANNEL_A = true,
         CHANNEL_B = true;
    /* Routine to check if any motor stops or runs */
    if (REMAINING_X_STEPS == 0) STEPPER_MOTORS |= (1 << A1_EN);
    if (REMAINING_Y_STEPS == 0) STEPPER_MOTORS |= (1 << A2_EN);

    if ((REMAINING_X_STEPS == 0) && (REMAINING_Y_STEPS == 0))   // Neither motor on x-axis nor motor y-axis has any more steps to run.
    {
      CHANNEL_A = false;
      CHANNEL_B = false;
    }
    else if ((REMAINING_X_STEPS == 0) ^ (REMAINING_Y_STEPS == 0))   // Either motor on x-axis or motor y-axis stops.
    {
      if (REMAINING_X_STEPS == 0)   // Motor on x-axis stops
      {
        CHANNEL_A = false;
        REMAINING_Y_STEPS -= 1;
      }
      else  // Motor on y-axis stops.
      {
        CHANNEL_B = false;
        REMAINING_X_STEPS -= 1;
      }
    }
    else  // Both motors keep running.
    {
      REMAINING_X_STEPS -= 1;
      REMAINING_Y_STEPS -= 1;
    }

    // Keep the enabled motor(s) running and stop the disabled motor(s)
    PWM_StartStop(STEPPER_TIMER, CHANNEL_A, CHANNEL_B);
  }
}