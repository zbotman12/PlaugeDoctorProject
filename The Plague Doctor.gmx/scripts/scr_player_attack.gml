/* shoots a dart */
if (click && dartCount > 0) {
    with (instance_create(obj_player.x, obj_player.y, obj_dart)) {
        move_towards_point(mouse_x, mouse_y, 25);
    }
    dartCount--;
}

