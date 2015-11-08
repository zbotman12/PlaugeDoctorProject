if(temp==0) temp = slopeScanValue;
slopeScanValue = ladderSpeed - 1;
if (!place_meeting(x, y - 1, obj_ladder_climb_mask) || jump) 
{
    v_y=0;
    g=2;
    slopeScanValue = temp;
    temp = 0;
    state = states.normal;
}
else if (up) v_y = -ladderSpeed; 
else if (down) v_y = ladderSpeed; 
else
{
v_y = 0; //If motionless on ladder 
g=0;
}
scr_player_motion(maxWalkingSpeed, maxRunningSpeed, jumpingSpeed)
scr_player_collision(obj_wall);

