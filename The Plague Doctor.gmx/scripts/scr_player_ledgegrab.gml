//------------------------------------------------GRABBING ON GRAB WALLS


if(place_meeting(x, y, obj_grabBlock) 
                && keyboard_check(vk_control)) {
    grabbing = true;
}

// if you're grabbing you can't go left, right, up or down.
if (grabbing) {
    v_y = 0;
    g = 0;
    if (keyboard_check_released(vk_control)) {
        grabbing = false;
        g = 2;
    }
    if (keyboard_check_pressed(vk_space)) {
        grabbing = false;
        v_y = 0;
        g = 2;
    }
    if (!place_meeting(x, y, obj_grabBlock)) {
        grabbing = false;
        g = 2;
    }
}

