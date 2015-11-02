/****LADDERS****/

if ((keyboard_check(ord("W")) || keyboard_check(ord("S"))) && place_meeting(x, y + 1, obj_white_ladder)) {
        climbing = true;
}

if (climbing) {
    g = 0;

    if (keyboard_check(ord("W"))) {
        v_y = -11;
    }
    else if (keyboard_check(ord("S"))) {
        v_y = 11;
    }
    else {
        v_y = 0;
    }
    if (!place_meeting(x, y, obj_white_ladder)) {
        climbing = false;
        v_y = 0;
        g = 2;
    }
    if (keyboard_check(vk_space)) {
        climbing = false;
        v_y = 0;
        g = 2;
    }
}

