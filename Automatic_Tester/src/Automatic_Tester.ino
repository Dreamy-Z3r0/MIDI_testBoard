#include <Arduino.h>

#define A2_DIR  PORTD5
#define A2_STEP PORTD6
#define A2_EN   PORTD7
#define A1_DIR  PORTB0
#define A1_STEP PORTB1
#define A1_EN   PORTB2

#define A1_STEP_HIGH  PORTB |=  (1<< A1_STEP) 
#define A1_STEP_LOW   PORTB &= ~(1<< A1_STEP)

#define A2_STEP_HIGH  PORTD |= (1<< A2_STEP)
#define A2_STEP_HIGH  PORTD &= ~(1<< A2_STEP)

uint8_t startButton = 3; // use INT1
bool running = false;
float lastPos[2] = {1,1};

void setup()
{
    //PinMode for A2
    DDRD |= (1<< A2_DIR);
    DDRD |= (1<< A2_STEP);
    DDRD |= (1<< A2_EN);
    //PinMode for A1
    DDRB |= (1<< A1_DIR);
    DDRB |= (1<< A1_STEP);
    DDRB |= (1<< A1_EN);
    //Clear Enable pin for A1 and A2
    PORTD &= ~(1<<A2_EN);
    PORTB &= ~(1<<A1_EN);
    //Set startButton as Input
    DDRD &= ~(1<< startButton);
    // Rising edge of INT1 generates interrupt
    EICRA |= (1<<ISC11);
    EICRA |= (1<<ISC10;
    // Enable interrrupts for INT1
    EIMSK |= (1<< INT1); 
    noInterrupts();
    TCCR1A=0;
    TCCR1B =0;
    TCNT1 = 0;
    OCR1A = 1000; //compare value
    TCCR1B |= (1 << WGM12);                   // CTC mode
    TCCR1B |= ((1 << CS11) | (1 << CS10));    // 64 prescaler
    interrupts();
    
    get_lastPosition();
    moveTo(0,0, lastPos[0], lastPos[2]);
}

void loop()
{
  if (running)
  {
    running = false;
    run();
    attachInterrupt(digitalPinToInterrupt(startButton),startService,RISING);
  }
}




void startService()
{
  detachInterrupt(digitalPinToInterrupt(startButton));
  running = true;
}

void run()
{
  
}

void moveTo(float des_X1, float des_Y1, float from_X0, float from_Y0)
{
  lastPos[0] = des_X1;
  lastPos[1] = des_Y1;
}

void get_lastPosition()
{
  
}

void save_lastPosition()
{
  
}

/*******************************************
 *** Output control signal(s) for motors ***
 *******************************************/
const uint32_t MAX_COUNTER_VALUE_TIM1 = 65535;
uint32_t COMPARE_MATCH_VALUE_TIM1, BASE_COUNTER_VALUE_TIM1;

void Initialization(uint8_t TIMER_ID, double PERIOD_MS)    // Called once at boot, or whenever user wants to change control signal.
{
  double PERIOD = PERIOD_MS / 1000.0;
  if (1 == TIMER_ID)  // Timer 1 in use
  {
    TIMER_COUNTER_COMPARE_VALUE_UPDATE(TIMER_ID, PERIOD);

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

void TIMER_COUNTER_COMPARE_VALUE_UPDATE(uint8_t TIMER_ID, double PERIOD)
{
  if (1 == TIMER_ID)  // Timer 1 in use
  {
    BASE_COUNTER_VALUE_TIM1 = 65536 - (uint32_t)(PERIOD * 250000.0);
    COMPARE_MATCH_VALUE_TIM1 = (uint32_t)(PERIOD * 62500.0) - 1 + BASE_COUNTER_VALUE_TIM1;
  }
}

ISR(TIMER1_OVF_vect)
{
  bool CHANNEL_A = true,
       CHANNEL_B = true;
  /* Routine to check if any motor stops or runs */

  /* Routine to run or stop motors */
  if (CHANNEL_A || CHANNEL_B)   // At least one motor keeps running
  {
    if (CHANNEL_A) OCR1A = MAX_COUNTER_VALUE_TIM1;
    if (CHANNEL_B) OCR1B = MAX_COUNTER_VALUE_TIM1;

    ICR1 = COMPARE_MATCH_VALUE_TIM1;
    TCNT1 = BASE_COUNTER_VALUE_TIM1;

    PWM_StartStop(1, CHANNEL_A, CHANNEL_B);
  }
  else    // Both motors stop
    PWM_StartStop(1, CHANNEL_A, CHANNEL_B);
}