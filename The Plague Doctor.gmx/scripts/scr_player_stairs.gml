scr_player_motion(maxWalkingSpeed, maxRunningSpeed, 0);
scr_player_collision(obj_stair_block);
if (place_meeting(x, y + 1, obj_wall) && !place_meeting(x, y, obj_wall_ignore_mask)) 
{
    state = states.normal;
}
