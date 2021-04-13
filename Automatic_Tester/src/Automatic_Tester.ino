#include <Arduino.h>

#define STEPPER_MOTORS PORTB

#define A1_EN   PORTB0
#define A2_EN   PORTB5

#define A1_DIR  PORTB3
#define A2_DIR  PORTB4

#define A1_STEP PORTB1
#define A2_STEP PORTB2

double STEPPER_PWM_PERIOD = 2;    // milliseconds
double   STEPPER_PWM_DUTY = 75.0; // %  

bool ROTATION_DIRECTION[] = {true, true};  // true (default) - anti-clockwise rotation; false - c lockwise rotation

unsigned int STEPS_TO_TAKE[2];

unsigned int REMAINING_X_STEPS = 0;
unsigned int REMAINING_Y_STEPS = 0;

float DISPLACEMENT[2];
float lastPos[2] = {1,1};

const float positioning_Array[4][4][2] = {
    { {0,  0}, {38,  0}, {76,  0}, {114,  0} },
    { {0, 38}, {38, 38}, {76, 38}, {114, 38} },
    { {0, 76}, {38, 76}, {76, 76}, {114, 76} },
    { {0,114}, {38,114}, {76,114}, {114,114} }
};


/************************************************************
 *** Macros and flags used for commands from START button ***
 ************************************************************/

#define startButton 3   // Arduino hardware input pin number for START button

bool startButtonPressed = false;  // Indicates the states of the START button.

bool justStarted = false;   // Indicates the first time START button is pressed in one working cycle.
bool running = false;       // Flag for starting a working cycle of motors.

unsigned long StartButton_HeldTime;   // Used for managing held time of START button for STOP command.
bool stopCommand = false;   // Stop command is requested by user after START button has been held for some time (3 seconds).



void setup()
{
    // Set pin data direction for stepper-controlling pins
    DDRB |= ((1 << A2_DIR) | (1 << A2_STEP) | (1 << A2_EN));
    DDRB |= ((1 << A1_DIR) | (1 << A1_STEP) | (1 << A1_EN));

    // Disable stepper motors initially to avoid any unwanted operations.
    STEPPER_MOTORS |= ((1 << A2_EN) | (1 << A1_EN));

    //Set startButton as input
    pinMode(startButton, INPUT);

    // Enable interrrupts for INT1
    attachInterrupt(digitalPinToInterrupt(startButton), startService, FALLING);

    Initialization(1, STEPPER_PWM_PERIOD, STEPPER_PWM_PERIOD*(STEPPER_PWM_DUTY/100.0));
}

void loop()
{
  while (startButtonPressed)
  {
    if (3000 + StartButton_HeldTime <= 0xFFFFFFFF)
    {
      if (millis() - StartButton_HeldTime >= 3000)
      {
        startButtonPressed = false;
        detachInterrupt(digitalPinToInterrupt(startButton));
        stopCommand = true;
        attachInterrupt(digitalPinToInterrupt(startButton), startService, FALLING);
      }
    }
    else
    {
      if (millis() >= (3000 - (0xFFFFFFFF - StartButton_HeldTime)))
      {
        startButtonPressed = false;
        detachInterrupt(digitalPinToInterrupt(startButton));
        stopCommand = true;
        attachInterrupt(digitalPinToInterrupt(startButton), startService, FALLING);
      }      
    }
  }

  if (running)
  {
    running = false;
    run();
  }
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
  if (!running)
  {
    running = true;
    justStarted = true;
  }
  attachInterrupt(digitalPinToInterrupt(startButton), startService, FALLING);
}

void run()
{
  
}

void moveTo(float des_X1, float des_Y1)
{
  get_lastPosition();   // Update the cursor's latest position

  // Calculate the steps to take by each axis
  float DISPLACEMENT_X = des_X1 - lastPos[0];
  float DISPLACEMENT_Y = des_Y1 - lastPos[1];

  DISPLACEMENT_TO_STEPS(DISPLACEMENT_X, &ROTATION_DIRECTION[0], &STEPS_TO_TAKE[0]);
  DISPLACEMENT_TO_STEPS(DISPLACEMENT_Y, &ROTATION_DIRECTION[1], &STEPS_TO_TAKE[1]);

  REMAINING_X_STEPS = STEPS_TO_TAKE[0];
  REMAINING_Y_STEPS = STEPS_TO_TAKE[1];

  /* Run, Barry. Run! */

  // Set rotation direction for motors
  if (ROTATION_DIRECTION[0])
    STEPPER_MOTORS &= ~(1 << A1_DIR);
  else
    STEPPER_MOTORS |=  (1 << A1_DIR);

  if (ROTATION_DIRECTION[1])
    STEPPER_MOTORS &= ~(1 << A2_DIR);
  else
    STEPPER_MOTORS |=  (1 << A2_DIR);

  // Enable or disable motors
  if (0 < STEPS_TO_TAKE[0])
    STEPPER_MOTORS &= ~(1 << A1_EN);
  else
    STEPPER_MOTORS |=  (1 << A1_EN);

  if (0 < STEPS_TO_TAKE[1])
    STEPPER_MOTORS &= ~(1 << A2_EN);
  else
    STEPPER_MOTORS |=  (1 << A2_EN);

  // Start outputing PWM control signals
  PWM_StartStop(1, REMAINING_X_STEPS > 0, REMAINING_Y_STEPS > 0);
}

// Update the cursor's latest position
void get_lastPosition()
{
  lastPos[0] += STEPS_TO_DISPLACEMENT(STEPS_TO_TAKE[0]-REMAINING_X_STEPS, ROTATION_DIRECTION[0]);
  lastPos[1] += STEPS_TO_DISPLACEMENT(STEPS_TO_TAKE[1]-REMAINING_Y_STEPS, ROTATION_DIRECTION[1]);

  if ((0 == REMAINING_Y_STEPS) && (0 == REMAINING_X_STEPS))
  {
    STEPS_TO_TAKE[0] = 0;
    STEPS_TO_TAKE[1] = 0;

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
  return (ROTATION_DIRECTION ? 40.0 : -40.0) * STEPS;
}

void DISPLACEMENT_TO_STEPS(float DISPLACEMENT_MM, bool *ROTATION_DIRECTION, unsigned int *STEPS)
{
  *ROTATION_DIRECTION = (DISPLACEMENT_MM >= 0);

  float DISTANCE = DISPLACEMENT >= 0 ? DISPLACEMENT_MM : -DISPLACEMENT_MM;
  *STEPS = (unsigned int)(DISTANCE / 40.0);
}


/*******************************************
 *** Output control signal(s) for motors ***
 *******************************************/
const uint32_t MAX_COUNTER_VALUE_TIM1 = 65535;
uint32_t COMPARE_MATCH_VALUE_TIM1, BASE_COUNTER_VALUE_TIM1;

void Initialization(uint8_t TIMER_ID, double PERIOD_MS, double DUTY_CYCLE_MS)    // Called once at boot, or whenever user wants to change control signal.
{
  double PERIOD = PERIOD_MS / 1000.0;
  double   DUTY = DUTY_CYCLE_MS / PERIOD_MS;

  if (1 == TIMER_ID)  // Timer 1 in use
  {
    TIMER_COUNTER_COMPARE_VALUE_UPDATE(TIMER_ID, PERIOD, DUTY);

    // Set initial value for counter limit and counter compare match value
    OCR1A = MAX_COUNTER_VALUE_TIM1;
    OCR1B = MAX_COUNTER_VALUE_TIM1;
    ICR1 = COMPARE_MATCH_VALUE_TIM1;
    TCNT1 = BASE_COUNTER_VALUE_TIM1;

    // Set counter mode: Fast PWM mode 15
    TCCR1A |= ((1 << WGM11) | (1 << WGM10));
    TCCR1B |= ((1 << WGM13) | (1 << WGM12));
    
    // Enable overflow interrupt
    cli();
    TIMSK1 = 1;   // Only enable overflow interrupt
    sei();
  }
}

void PWM_StartStop(uint8_t TIMER_ID, bool CHANNEL_A, bool CHANNEL_B)    // Called when at least a motor's behaviour is changed.
{
  if (1 == TIMER_ID)  // Timer 1 in use
  {
    if (CHANNEL_B)  // Enable inverted fast PWM on channel B of Timer 1 (pin OC1B - Arduino D10)
      TCCR1A |=  ((1 << COM1B1) | (1 << COM1B0));
    else            // Disable inverted fast PWM on channel B of Timer 1 (pin OC1B - Arduino D10)
      TCCR1A &= ~((1 << COM1B1) | (1 << COM1B0));

    if (CHANNEL_A)  // Enable inverted fast PWM on channel A of Timer 1 (pin OC1A - Arduino D9)
      TCCR1A |= ((1 << COM1A1) | (1 << COM1A0));
    else            // Disable inverted fast PWM on channel B of Timer 1 (pin OC1A - Arduino D9)
      TCCR1A &= ~((1 << COM1A1) | (1 << COM1A0));  

    if ((!CHANNEL_B) && (!CHANNEL_A))   // Stop Timer 1: Stop PWM on both pins OC1A and OC1B
      TCCR1B &= ~((1 << CS12) | (1 << CS11) | (1 << CS10));
    else    // Timer 1 running: PWM enabled on either OC1A or OC1B, or both pins
    {
      // Precaler = 64
      TCCR1B &=  ~(1 << CS12);
      TCCR1B |=  ((1 << CS11) | (1 << CS10));
    }
  }
}

void TIMER_COUNTER_COMPARE_VALUE_UPDATE(uint8_t TIMER_ID, double PERIOD, double DUTY)
{
  if (1 == TIMER_ID)  // Timer 1 in use
  {
    BASE_COUNTER_VALUE_TIM1 = 65536 - (uint32_t)(PERIOD * 250000.0);
    COMPARE_MATCH_VALUE_TIM1 = (uint32_t)(PERIOD * (1 - DUTY) * 250000.0) - 1 + BASE_COUNTER_VALUE_TIM1;
  }
}

ISR(TIMER1_OVF_vect)
{
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

  /* Routine to run or stop motors */
  if (CHANNEL_A || CHANNEL_B)   // At least one motor keeps running
  {
    // Update timer parameters as required by the mode of timer (described in the datasheet)
    if (CHANNEL_A) OCR1A = MAX_COUNTER_VALUE_TIM1;
    if (CHANNEL_B) OCR1B = MAX_COUNTER_VALUE_TIM1;

    ICR1 = COMPARE_MATCH_VALUE_TIM1;
    TCNT1 = BASE_COUNTER_VALUE_TIM1;

    // Keep the enabled motor running
    PWM_StartStop(1, CHANNEL_A, CHANNEL_B);
  }
  else    // Both motors stop
    PWM_StartStop(1, CHANNEL_A, CHANNEL_B);
}