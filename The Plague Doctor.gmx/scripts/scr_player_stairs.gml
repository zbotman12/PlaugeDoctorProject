if (place_meeting(x, y + 1, obj_wall_parent) && !place_meeting(x, y, obj_wall_ignore_mask)) 
{
    state = states.normal;
}
