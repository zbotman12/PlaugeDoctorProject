//------------------------------------------------GRABBING ON GRAB WALLS


if(place_meeting(x, y, obj_grabBlock)) {
    grabbing = true;
}

// if you fall into a grab you slowly deccelerate.
if (grabbing) {
    g = 0;
    
    if (v_y > 0) {
        v_y -= 2;
    } 
    else {
        v_y = 0;
    }
    
    if (keyboard_check(vk_space)) {
            v_y = 0;
            g = 2;
    }

    if (!place_meeting(x, y, obj_grabBlock)) {
        grabbing = false;
        g = 2;
    }
}


