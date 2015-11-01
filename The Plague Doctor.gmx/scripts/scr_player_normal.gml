scr_player_get_inputs();
scr_player_ladder();

// Right and left keys set velocities.
if (right && !left) {

    // only this speed if walking
    if (!runButton) {
        v_x = maxWalkingSpeed;
    }

    image_xscale = 1; // Flip sprite.

    //Shift eases into a running speed based on fric
    if (runButton && v_x < maxRunningSpeed) {      
        // divided by two just makes it take longer to reach 10
        v_x += fric;
    }
}


if (left && !right) {

    if (!runButton) {
        v_x = -maxWalkingSpeed;
}
    
    image_xscale = -1; // Flip sprite.

    // Shift increases speed.

    if (runButton && v_x > -maxRunningSpeed) {
        v_x -= fric;
    }
}
    
    // jumping if grounded and space is pressed
if (keyboard_check_pressed(vk_space) && grounded) {
    v_y = -jumpingSpeed;
}

//------------------------------------------------END OF WALK/RUN DECELERATION

if (!right && v_x > 0) {
    v_x -= fric; // fric can be changed depending on floor tile
    if (v_x < 0){
        v_x = 0;
    }
}
else if (!left && v_x < 0) {
    v_x += fric;
    if (v_x > 0){
        v_x = 0;
    }
}
if (rightAndLeftPressed && v_x > 0) {  // pressing left and right don't cancel momentum
            v_x -= fric;
            image_xscale = -1; // flip the sprite in motion's direction
    if (v_x < 0){
        v_x = 0;
    }
}
else if (rightAndLeftPressed
        && v_x < 0) {
            v_x += fric;
            image_xscale = 1;
    if (v_x > 0){
        v_x = 0;
    }
}

//------------------------------------------------SLOPE CHANGES RUNNING SPEED AND FRIC


if (place_meeting(x, y + 1, obj_slope_parent)) {
    maxRunningSpeed = 5;
    
    // if already going faster than the new speed limit bring it down.
    if (v_x > maxRunningSpeed) {
        v_x -= fric;
    }
    if (v_x < -maxRunningSpeed) {
        v_x += fric;
    }
} else {
    maxRunningSpeed = 10;
}

if(place_meeting(x, y + 1, obj_stair_block)){
    state = states.staircase;
}



scr_player_collision(obj_wall);
scr_player_sprite_control();


