/****LADDERS****/

if ((keyboard_check_direct(ord("W")) || keyboard_check_direct(ord("S"))) && place_meeting(x, y + 1, obj_ladder_climb_mask)) {
        climbing = true;
}

if (climbing) {

    jumpingSpeed = 0;

    if (keyboard_check_direct(ord("W"))) {
        v_y = -ladderSpeed;
    }
    else if (keyboard_check_direct(ord("S"))) {
        v_y = ladderSpeed;
    }
    else {
        v_y = 0;
        g = 0;
    }
    if (!place_meeting(x, y - 1, obj_ladder_climb_mask)) {
        climbing = false;
        v_y = 0;
        g = 2;
    }
    if (keyboard_check(vk_space)) {
        climbing = false;
        v_y = 0;
        g = 2;
    }
} else {
    jumpingSpeed = 20;
}

