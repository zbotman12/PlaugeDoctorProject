
// Destroys on collision
if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_Soldier)) {
    with (obj_dart) {
        instance_destroy();
    }
}

