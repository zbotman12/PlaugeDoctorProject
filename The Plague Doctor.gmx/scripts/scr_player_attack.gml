/* shoots a dart */

angle = point_direction(x, y, mouse_x, mouse_y);
if (click && dartCount > 0) {
    with (instance_create(obj_player.x, obj_player.y, obj_dart)) {
        move_towards_point(mouse_x, mouse_y, 20);
        //instance_change(obj_ammo, false);
    }
    dartCount--;
}
