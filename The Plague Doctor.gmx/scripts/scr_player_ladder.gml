/****LADDERS****/

if (keyboard_check((vk_up) || (vk_down)) && place_meeting(x, y, obj_white_ladder)) {
        climbing = true;
    }

if (climbing) {
    v_y = 0;
    g = 0;

    if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        v_y -= 20;
    }
    else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        v_y += 20;
    }
    if (!place_meeting(x, y, obj_white_ladder)) {
        climbing = false;
        v_y = 0;
    }
    if (keyboard_check(vk_space)) {
        climbing = false;
        v_y = 0;
    }
}



