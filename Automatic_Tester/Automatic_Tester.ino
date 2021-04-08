#define A2_DIR  PD5
#define A2_STEP PD6
#define A2_EN   PD7
#define A1_DIR  PB0
#define A1_STEP PB1
#define A1_EN   PB2

#define A1_STEP_HIGH  PORTB |=  (1<< A1_STEP) 
#define A1_STEP_LOW   PORTB &= ~(1<< A1_STEP)

#define A2_STEP_HIGH  PORTD |= (1<< A2_STEP)
#define A2_STEP_HIGH  PORTD &= ~(1<< A2_STEP)

uint8_t startButton = D3; /& use INT1
bool running = false;
float lastPos[2] = {1,1};

void setup()
{
    DDRD &= ~(1<< startButton);
    // Rising edge of INT1 generates interrupt
    EICRA |= (1<<ISC11);
    EICRA |= (1<<ISC10;
    // Enable interrrupts for INT1
    EIMSK |= (1<< INT1); 
    
    get_lastPosition();
    moveTo(0,0, lastPos[0], lastPos[2]);
}

void loop()
{
  if(running)
  {
    running = false;
    run();
    attachInterrupt(digitalPinToInterrupt(startButton),startService,RISING);
  }
}
ISR(INT1_vect)
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
