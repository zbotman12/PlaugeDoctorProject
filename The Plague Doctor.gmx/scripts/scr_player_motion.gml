var maxWalkingSpeed = argument0;
var maxRunSpeed = argument1;
var jumpSpeed = argument2;
var Runningfric = fric * 2;
var Slowingfric = fric / 2;
var Airfric = fric / 2;

//Inputs
//------------------------------------------------WALK/RUN
if(grounded)
{
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
}
else //Not grounded
{
    if (right && !left)
    {
        image_xscale = abs(image_xscale); // Flip sprite.
        v_x += Airfric;
        if(v_x > maxAirSpeed)
        {
            v_x = maxAirSpeed;
        }
    }
    
    if (left && !right)
    {
        image_xscale = -1 * abs(image_xscale); // Flip sprite.
        v_x -= Airfric;
        if(v_x < -maxAirSpeed)
        {
            v_x = -maxAirSpeed;
        }
    }
    //------------------------------------------------END OF WALK/RUN DECELERATION
    if (!left && v_x > 0)
    {
       v_x -= Airfric / 2;
       if (v_x < 0) { v_x = 0; }
    }
    
    else if (!right && v_x < 0)
    {
        v_x += Airfric / 2;
        if (v_x > 0) { v_x = 0; }
    }
    
    else if (rightAndLeftPressed && v_x > 0)
    {
        v_x -= Airfric / 2;
        image_xscale = -1 * abs(image_xscale);
        if (v_x < 0) { v_x = 0; }
    }
    
    else if (rightAndLeftPressed && v_x < 0) 
    {
        v_x += Airfric / 2;
        image_xscale = abs(image_xscale);
        if (v_x > 0) { v_x = 0; }
    }
}

if (jump)
{
    if(grounded)
    {
        startJumpCount = true;
        v_y -= baseJumpSpeed;
        if(runButton)
        {
            maxAirSpeed = maxRunSpeed;
        }
        else
        {
            maxAirSpeed = maxWalkingSpeed;
        }
    }
    else if (startJumpCount)
    {
        v_y -= jumpSpeed;
        if(runButton)
        {
            maxAirSpeed = maxRunSpeed;
        }
        else
        {
            maxAirSpeed = maxWalkingSpeed;
        }
        jumpCounter--;
        
        if(jumpCounter <= 0)
        {
            jumpCounter = jumpCounterMax;
            startJumpCount = false;
        }
    }
}
