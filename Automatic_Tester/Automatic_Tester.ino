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

struct stepperInfo {
  // externally defined parameters
  float acceleration;
  volatile unsigned long minStepInterval; // ie. max speed, smaller is faster
  void (*dirFunc)(int);
  void (*stepFunc)();

  // derived parameters
  unsigned int c0;                // step interval for first step, determines acceleration
  long stepPosition;              // current position of stepper (total of all movements taken so far)

  // per movement variables (only changed once per movement)
  volatile int dir;                        // current direction of movement, used to keep track of position
  volatile unsigned int totalSteps;        // number of steps requested for current movement
  volatile bool movementDone = false;      // true if the current movement has been completed (used by main program to wait for completion)
  volatile unsigned int rampUpStepCount;   // number of steps taken to reach either max speed, or half-way to the goal (will be zero until this number is known)
  volatile unsigned long estStepsToSpeed;  // estimated steps required to reach max speed
  volatile unsigned long estTimeForMove;   // estimated time (interrupt ticks) required to complete movement
  volatile unsigned long rampUpStepTime;
  volatile float speedScale;               // used to slow down this motor to make coordinated movement with other motors

  // per iteration variables (potentially changed every interrupt)
  volatile unsigned int n;                 // index in acceleration curve, used to calculate next interval
  volatile float d;                        // current interval length
  volatile unsigned long di;               // above variable truncated
  volatile unsigned int stepCount;         // number of steps completed in current movement
};

void A1_STEP() {
    A1_STEP_HIGH
    A1_STEP_LOW
}

void A1Dir(int dir) {
  digitalWrite(A1_DIR, dir);
}

void A2_STEP() {
    A2_STEP_HIGH
    A2_STEP_LOW
}

void A2Dir(int dir) {
  digitalWrite(A2_DIR, dir);
}

void resetStepperInfo( stepperInfo& si ) {
  si.n = 0;
  si.d = 0;
  si.di = 0;
  si.stepCount = 0;
  si.rampUpStepCount = 0;
  si.rampUpStepTime = 0;
  si.totalSteps = 0;
  si.stepPosition = 0;
  si.movementDone = false;
}

#define NUM_STEPPERS 2
volatile stepperInfo steppers[NUM_STEPPERS];

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

    steppers[0].dirFunc = A1Dir;
    steppers[0].stepFunc = A1_STEP;
    steppers[0].acceleration = 1000;
    steppers[0].minStepInterval = 50;

    steppers[1].dirFunc = A2Dir;
    steppers[1].stepFunc = A2_STEP;
    steppers[1].acceleration = 1000;
    steppers[1].minStepInterval = 50;
    
    get_lastPosition();
    moveTo(0,0, lastPos[0], lastPos[2]);
}

void resetStepper(volatile stepperInfo& si) {
  si.c0 = si.acceleration;
  si.d = si.c0;
  si.di = si.d;
  si.stepCount = 0;
  si.n = 0;
  si.rampUpStepCount = 0;
  si.movementDone = false;
  si.speedScale = 1;

  float a = si.minStepInterval / (float)si.c0;
  a *= 0.676;

  float m = ((a*a - 1) / (-2 * a));
  float n = m * m;

  si.estStepsToSpeed = n;
}
volatile byte remainingSteppersFlag = 0;

float getDurationOfAcceleration(volatile stepperInfo& s, unsigned int numSteps) {
  float d = s.c0;
  float totalDuration = 0;
  for (unsigned int n = 1; n < numSteps; n++) {
    d = d - (2 * d) / (4 * n + 1);
    totalDuration += d;
  }
  return totalDuration;
}

void prepareMovement(int whichMotor, long steps) {
  volatile stepperInfo& si = steppers[whichMotor];
  si.dirFunc( steps < 0 ? HIGH : LOW );
  si.dir = steps > 0 ? 1 : -1;
  si.totalSteps = abs(steps);
  resetStepper(si);
  
  remainingSteppersFlag |= (1 << whichMotor);

  unsigned long stepsAbs = abs(steps);

  if ( (2 * si.estStepsToSpeed) < stepsAbs ) {
    // there will be a period of time at full speed
    unsigned long stepsAtFullSpeed = stepsAbs - 2 * si.estStepsToSpeed;
    float accelDecelTime = getDurationOfAcceleration(si, si.estStepsToSpeed);
    si.estTimeForMove = 2 * accelDecelTime + stepsAtFullSpeed * si.minStepInterval;
  }
  else {
    // will not reach full speed before needing to slow down again
    float accelDecelTime = getDurationOfAcceleration( si, stepsAbs / 2 );
    si.estTimeForMove = 2 * accelDecelTime;
  }
}

volatile byte nextStepperFlag = 0;

void setNextInterruptInterval() {

  bool movementComplete = true;

  unsigned long mind = 999999;
  for (int i = 0; i < NUM_STEPPERS; i++) {
    if ( ((1 << i) & remainingSteppersFlag) && steppers[i].di < mind ) {
      mind = steppers[i].di;
    }
  }

  nextStepperFlag = 0;
  for (int i = 0; i < NUM_STEPPERS; i++) {
    if ( ! steppers[i].movementDone )
      movementComplete = false;
    if ( ((1 << i) & remainingSteppersFlag) && steppers[i].di == mind )
      nextStepperFlag |= (1 << i);
  }

  if ( remainingSteppersFlag == 0 ) {
    TIMER1_INTERRUPTS_OFF
    OCR1A = 65500;
  }

  OCR1A = mind;
}

ISR(TIMER1_COMPA_vect)
{
  unsigned int tmpCtr = OCR1A;

  OCR1A = 65500;

  for (int i = 0; i < NUM_STEPPERS; i++) {

    if ( ! ((1 << i) & remainingSteppersFlag) )
      continue;

    if ( ! (nextStepperFlag & (1 << i)) ) {
      steppers[i].di -= tmpCtr;
      continue;
    }

    volatile stepperInfo& s = steppers[i];

    if ( s.stepCount < s.totalSteps ) {
      s.stepFunc();
      s.stepCount++;
      s.stepPosition += s.dir;
      if ( s.stepCount >= s.totalSteps ) {
        s.movementDone = true;
        remainingSteppersFlag &= ~(1 << i);
      }
    }

    if ( s.rampUpStepCount == 0 ) {
      s.n++;
      s.d = s.d - (2 * s.d) / (4 * s.n + 1);
      if ( s.d <= s.minStepInterval ) {
        s.d = s.minStepInterval;
        s.rampUpStepCount = s.stepCount;
      }
      if ( s.stepCount >= s.totalSteps / 2 ) {
        s.rampUpStepCount = s.stepCount;
      }
      s.rampUpStepTime += s.d;
    }
    else if ( s.stepCount >= s.totalSteps - s.rampUpStepCount ) {
      s.d = (s.d * (4 * s.n + 1)) / (4 * s.n + 1 - 2);
      s.n--;
    }

    s.di = s.d * s.speedScale; // integer
  }

  setNextInterruptInterval();

  TCNT1  = 0;
}


void runAndWait() {
  adjustSpeedScales();
  setNextInterruptInterval();
  TIMER1_INTERRUPTS_ON
  while ( remainingSteppersFlag );
  remainingSteppersFlag = 0;
  nextStepperFlag = 0;
}

void adjustSpeedScales() {
  float maxTime = 0;
  
  for (int i = 0; i < NUM_STEPPERS; i++) {
    if ( ! ((1 << i) & remainingSteppersFlag) )
      continue;
    if ( steppers[i].estTimeForMove > maxTime )
      maxTime = steppers[i].estTimeForMove;
  }

  if ( maxTime != 0 ) {
    for (int i = 0; i < NUM_STEPPERS; i++) {
      if ( ! ( (1 << i) & remainingSteppersFlag) )
        continue;
      steppers[i].speedScale = maxTime / steppers[i].estTimeForMove;
    }
  }
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
