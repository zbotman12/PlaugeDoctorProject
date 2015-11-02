//------------------------------------------------GRABBING ON GRAB WALLS
/*

if(place_meeting(x + 1, y, obj_grabBlock) 
                && keyboard_check(vk_control) 
                && grounded) {
    grabbing = true;
} else {
    grabbing = false;
}

/* Same code but for the left side. 
 * Since sign(x) can return 0 it can't be used for grabs.
 */
 /*
if(place_meeting(x - 1, y, obj_grabBlock)
                && keyboard_check(vk_control) 
                && grounded) {
    grabbing = true;
} else {
    grabbing = false;
}

// if you're grabbing you can't go left, right, up or down.
if (grabbing) {
    v_y = 0;
    v_x = 0;
    grounded = true;
    x = xprevious;
    y = yprevious;
}

// resets grabbing if you're not holding grab
if (!keyboard_check(vk_control)) {
    grabbing = false;
}

*/
