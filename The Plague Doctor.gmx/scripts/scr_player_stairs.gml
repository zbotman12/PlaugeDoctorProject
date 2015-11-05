//------------------------------------------------STAIRS
if(place_meeting(x, y + 1, obj_enter_stairs_mask) 
   && (up || down))
{
    stairs = true;
}

if(stairs) 
{
    jumpingSpeed = 0;
    scr_player_collision(obj_stair_block);
    
    if (place_meeting(x, y + 1, obj_wall) 
        && !place_meeting(x, y, obj_wall_ignore_mask)) 
    {
        stairs = false;
    }  
} 
else 
{
    scr_player_collision(obj_wall);
    jumpingSpeed = 20;
    stairs = false;
}

