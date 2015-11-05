if (click) {   
    if (alarm[0] == -1 && scr_inv_itemExists(0)) {
        with (instance_create(obj_player.x, obj_player.y, obj_dart)) {
            move_towards_point(mouse_x, mouse_y, 20);
        } 
        alarm[0] = room_speed * 0.5;
        scr_inv_removeItem(0);
    }
}
