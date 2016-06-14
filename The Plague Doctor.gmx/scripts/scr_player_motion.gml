var maxWalkingSpeed = argument0;
var maxRunSpeed = argument1;
var jumpSpeed = argument2;
var Runningfric = fric * 2;
var Slowingfric = fric / 2;

if(!grounded)
{
    maxWalkingSpeed = argument1 * 0.7;
    maxRunSpeed = argument1 * 0.7;
}
else
{
    maxWalkingSpeed = argument0;
    maxRunSpeed = argument1;
}

//Inputs
//------------------------------------------------WALK/RUN

if (right && !left)
{
    image_xscale = abs(image_xscale); // Flip sprite.
    if (!runButton) 
    {
        v_x += Runningfric;
        if(v_x > maxWalkingSpeed)
        {
            v_x = maxWalkingSpeed;
        }
    }
    else
    {
        v_x += fric;
        if(v_x > maxRunSpeed)
        {
            v_x = maxRunSpeed;
        }
    }
    lastDir = 1;
}

if (left && !right)
{
    image_xscale = -1 * abs(image_xscale); // Flip sprite.
    if (!runButton)
    {
        v_x -= Runningfric;
        if(v_x < -maxWalkingSpeed)
        {
            v_x = -maxWalkingSpeed;
        }
    }
    else
    {
        v_x -= fric;
        if(v_x < -maxRunSpeed)
        {
            v_x = -maxRunSpeed;
        }
    }
    lastDir = -1;
}
    
if (jump && grounded) { v_y = -jumpSpeed; }

//------------------------------------------------END OF WALK/RUN DECELERATION

if (!left && v_x > 0)
{
   v_x -= Slowingfric;
   if (v_x < 0) { v_x = 0; }
}

else if (!right && v_x < 0)
{
    v_x += Slowingfric;
    if (v_x > 0) { v_x = 0; }
}

else if (rightAndLeftPressed && v_x > 0)
{
    v_x -= Slowingfric;
    image_xscale = -1 * abs(image_xscale);
    if (v_x < 0) { v_x = 0; }
}

else if (rightAndLeftPressed && v_x < 0) 
{
    v_x += Slowingfric;
    image_xscale = abs(image_xscale);
    if (v_x > 0) { v_x = 0; }
}

