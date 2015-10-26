//------------------------------------------------HIDING

if (grounded 
    && place_meeting(x, y, obj_crate) // if your colliding with the crate
    && keyboard_check(vk_down)) { // and down is pressed
                hidden = true;
}   
else {
    hidden = false;
}
