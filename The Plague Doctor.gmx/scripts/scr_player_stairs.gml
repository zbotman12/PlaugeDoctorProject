if(place_meeting(x, y + 1, obj_wall) && !place_meeting(x, y + 1, obj_stair_block)){
    state = states.normal;
}


if(up){
    scr_player_collision(obj_stair_block);
}else{
    scr_player_collision(obj_wall);
}

scr_player_sprite_control();
