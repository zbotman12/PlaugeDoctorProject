
// Destroys on collision
if (place_meeting(x + sign(vspeed) * 5, y + sign(vspeed) * 5, obj_wall) || place_meeting(x, y, obj_Soldier)) {
    with (obj_dart) {
        obj_dart.hspeed = 0;
        obj_dart.vspeed = 0;
        instance_change(obj_ammo, false);
    }
}

