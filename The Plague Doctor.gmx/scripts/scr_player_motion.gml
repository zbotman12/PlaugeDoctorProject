var maxWalkingSpeed = argument0;
var maxRunSpeed = argument1;
var jumpSpeed = argument2;
 
//Inputs

//------------------------------------------------WALK/RUN

if (right && !left) 
{
    image_xscale = abs(image_xscale); // Flip sprite.
    if (!runButton) 
    {
        v_x = maxWalkingSpeed;
    }
    if (runButton && v_x < maxRunSpeed)
    {
        v_x = maxRunSpeed;
    }
    lastDir = 1;
}

if (left && !right)
{
    image_xscale = -1 * abs(image_xscale); // Flip sprite.
    if (!runButton)
    {
        v_x = -maxWalkingSpeed;
    }
    if (runButton && v_x > -maxRunSpeed)
    {
        v_x = -maxRunSpeed;
    }
    lastDir = -1;
}
    
if (jump && grounded) { v_y = -jumpSpeed; }

//------------------------------------------------END OF WALK/RUN DECELERATION

if (!left && v_x > 0) 
{
    v_x -= fric;
    if (v_x < 0) { v_x = 0; }
}

else if (!right && v_x < 0) 
{
    v_x += fric;
    if (v_x > 0) { v_x = 0; }
}

else if (rightAndLeftPressed && v_x > 0) 
{
    v_x -= fric;
    image_xscale = -1 * abs(image_xscale);
    if (v_x < 0) { v_x = 0; }
}

else if (rightAndLeftPressed && v_x < 0) 
{
    v_x += fric;
    image_xscale = abs(image_xscale);
    if (v_x > 0) { v_x = 0; }
}

