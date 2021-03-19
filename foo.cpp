
float last_Pos[] = {10, 50};

void setup()
{
    // Initial settings

    get_lastPosition();
    moveTo(0, 0, last_Pos[0], last_Pos[1]);
}

void get_lastPosition()
{
    /* Read last position here */
}

void save_lastPosition()
{
    /* Save last position */
}

void moveTo(float des_X1, float des_Y1, float from_X0, float from_Y0)
{
    // Move commands

    last_Pos[0] = des_X1;
    last_Pos[1] = des_Y1;
}