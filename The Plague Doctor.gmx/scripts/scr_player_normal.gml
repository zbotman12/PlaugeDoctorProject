//Behavior

scr_phy_motion();
//scr_player_collision(obj_wall_parent);

//Transitions

if ((up || down) && place_meeting(x, y + 1, obj_ladder_climb_mask)) 
{
    state = states.ladder;
}

if(place_meeting(x, y + 1, obj_enter_stairs_mask) && (up || down))
{
    state = states.staircase;
}

if(place_meeting(x, y, obj_grabBlock)) 
{
    state = states.ledgegrab; 
}

