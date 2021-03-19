
uint8_t startButton = 3;
bool running = false;
float lastPos[2] = {1,1};

void setup()
{
    pinMode(startButton, INPUT);
    attachInterrupt(digitalPinToInterrupt(startButton),startService,RISING);
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
