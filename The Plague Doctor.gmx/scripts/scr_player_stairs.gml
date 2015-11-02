//------------------------------------------------STAIRS
if(place_meeting(x, y + 1, obj_ground_mask) 
    && (keyboard_check(vk_up) || keyboard_check(vk_down))){
    stairs = true;
}

if(stairs){
    scr_player_collision(obj_stair_block);
    
    if (place_meeting(x, y + 1, obj_wall) && !place_meeting(x, y, obj_slope_mask)) {
        stairs = false;
    }  
} else {
    scr_player_collision(obj_wall);
    stairs = false;
}
