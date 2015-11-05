/****LADDERS****/

if ((up || down) && place_meeting(x, y + 1, obj_ladder_climb_mask)) 
{
        climbing = true;
}

if (climbing) 
{
    jumpingSpeed = 0;

    if (up) { v_y = -ladderSpeed; }
    else if (down) { v_y = ladderSpeed; }
    else if (!place_meeting(x, y - 1, obj_ladder_climb_mask) || jump) 
    {
        climbing = false;
        v_y = 0;
        g = 2;
    }
    else //If motionless on ladder
    {
        v_y = 0;
        g = 0;
    }
    
} 
else 
{
    climbing = false;
    jumpingSpeed = 20;
}

