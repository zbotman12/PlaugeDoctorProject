/*----------------------------------------
   ____      _ _ _     _                 
  / ___|___ | | (_)___(_) ___  _ __  ___ 
 | |   / _ \| | | / __| |/ _ \| '_ \/ __|
 | |__| (_) | | | \__ \ | (_) | | | \__ \
  \____\___/|_|_|_|___/_|\___/|_| |_|___/

----------------------------------------*/
floorObject = argument0; 
//------------------------------------------------X-AXIS AND UPHILL SLOPE COLLISIONS


// If on collision course with the wall...
if (place_meeting(x + v_x, y, floorObject)) {

    // the variable for the number of pixels "up" character can climb
    yplus = 0;  
    
    /* While there is a collision some x, y ahead and above of player.
     * Checks how many pixels in y direction there are until there is no collision.
     * Example: if there are 5 pixels in the y for collision, yplus = 5 and while loop breaks.
     * Eventually, yplus > abs(some number). Therefore, abs(some number) states how many pixels
     * in the y direction the player can climb. 
     * Here, some number = 1 * v_x. Player can only go up inclines as much as his xVelocity.
     */
    while (place_meeting(x + v_x, y - yplus, floorObject) && yplus <= slopeScanValue) {
        yplus += 1;
    }
        
    // Uses new yplus, if there is a collision... (means one of the two conditions above returned false).   
    if (place_meeting(x + v_x, y - yplus, floorObject)) {
    
        // While you haven't collided yet...
        while(!place_meeting(x + sign(v_x), y, floorObject)) {
        
                // Move one pixel right or left.
                x += sign(v_x);
        }
        // When you collide, set v_x = 0.
        v_x = 0;
    }
    else {
        y -= yplus;
    }
}
x += v_x; // Check for collisions first, then update x.


//------------------------------------------------Y-AXIS COLLISIONS


if (place_meeting(x, y + v_y, floorObject)) {

// While you haven't collided yet...
    while(!place_meeting(x, y + sign(v_y), floorObject)) {
    
    // Move one pixel up or down.
        y += sign(v_y);
    }
    
    // When you collide, set v_y = 0.
    v_y = 0;
}
y += v_y;


//------------------------------------------------GOING DOWN SLOPES


yminus = 0;
while (!place_meeting(x + v_x, y + yminus, floorObject) && yminus <= slopeScanValue) {
    yminus += 1;
}
    
if (place_meeting(x + v_x, y + yminus, floorObject)) {
    grounded = true;
    y += yminus;
}
else {
    grounded = false;
}


//------------------------------------------------GRAVITY AND GROUNDED BOOLEAN


// If one pixel above ground, v_y = 0. If space is pressed, jump.
if (place_meeting(x, y + 1, floorObject)) {
    v_y = 0;
    grounded = true;
}
else { // Else, gravity pulls you down (falling is assumed).
    v_y += g;
    grounded = false; // Can't jump when not grounded.
}
  
