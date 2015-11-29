/*
*   argument0   =   max walking speed
*   argument1   =   max run speed
*   argument2   =   jump speed
*
*/

//------------------------------------------------WALK/RUN
 
if (right && !left) 
{
    image_xscale = 1; // Flip sprite.
    if (!runButton) { v_x = argument0; }
    if (runButton && v_x < argument1) { v_x += fric; }
}

if (left && !right) 
{
    image_xscale = -1;
    if (!runButton) { v_x = -argument0; }
    if (runButton && v_x > -argument1) { v_x -= fric; }
}
    
if (jump && grounded) { v_y = -argument2; }

//------------------------------------------------END OF WALK/RUN DECELERATION

if (!right && v_x > 0) 
{
    v_x -= fric;
    if (v_x < 0) { v_x = 0; }
}

else if (!left && v_x < 0) 
{
    v_x += fric;
    if (v_x > 0) { v_x = 0; }
}

else if (rightAndLeftPressed && v_x > 0) 
{
    v_x -= fric;
    image_xscale = -1;
    if (v_x < 0) { v_x = 0; }
}

else if (rightAndLeftPressed && v_x < 0) 
{
    v_x += fric;
    image_xscale = 1;
    if (v_x > 0) { v_x = 0; }
}

