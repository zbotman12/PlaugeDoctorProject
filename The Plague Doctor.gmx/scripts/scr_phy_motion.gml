var running = runButton && !fatiqued;
var crouching = crouchButton;
var moving = (right ^^ left);
var dir = 1;
if(grounded && !sliding) //Ground Movement
{  
    if(moving)
    {
        if(left)
        {
            dir = -1;
            image_xscale = -1 * abs(image_xscale);
        }
        else if (right)
        {
            dir = 1;
            image_xscale = abs(image_xscale);
        }
        if (crouching)
        {
           physics_apply_force(x,y, CrouchingSpeed * dir, 0);
                       if(dir == -1)
            {
                phy_speed_x  = max(phy_speed_x, maxCrouchingSpeed * dir);
            }else
            {
                phy_speed_x  = min(phy_speed_x, maxCrouchingSpeed * dir);
            }
           //physics_joint_set_value(motorJoint, phy_joint_motor_speed, CrouchingSpeed * image_xscale);
           //physics_joint_enable_motor(motorJoint, true);
        }
        else if(running)
        {
            physics_apply_force(x,y, RunningSpeed * dir, 0);
                        if(dir == -1)
            {
                phy_speed_x  = max(phy_speed_x, maxRunningSpeed * dir);
            }else
            {
                phy_speed_x  = min(phy_speed_x, maxRunningSpeed * dir);
            }
            //physics_joint_set_value(motorJoint, phy_joint_motor_speed ,RunningSpeed * image_xscale);
            //physics_joint_enable_motor(motorJoint, true);     
            if(crouchButtonPressed && slideCounter == slideTime)
            {
                sliding = true;
            }
        }
        else
        {
            physics_apply_force(x,y, WalkingSpeed * dir, 0);
            if(dir == -1)
            {
                phy_speed_x  = max(phy_speed_x, maxWalkingSpeed * dir);
            }else
            {
                phy_speed_x  = min(phy_speed_x, maxWalkingSpeed * dir);
            }
            //physics_joint_set_value(motorJoint, phy_joint_motor_speed ,WalkingSpeed * image_xscale);
            //physics_joint_enable_motor(motorJoint, true);
        }
    }
}
/*else //Air Movement
{
    if(rightAndLeftPressed)
    {
        //
    }
    else if(left)
    {
        image_xscale = -1 * abs(image_xscale);
        if(running)
        {
            physics_apply_force(x,y, -RunningSpeed/2, 0);
            phy_speed_x  = max(phy_speed_x, -maxRunningSpeed/2);    
        }
        else
        {
            physics_apply_force(x,y, -WalkingSpeed/2, 0);
            phy_speed_x  = max(phy_speed_x, -maxWalkingSpeed/2);
        }
    }
    else if (right)
    {
        image_xscale = abs(image_xscale);
        if(running)
        {
            physics_apply_force(x,y, RunningSpeed/2, 0);
            phy_speed_x  = min(phy_speed_x, maxRunningSpeed/2);    
        }
        else
        {
            physics_apply_force(x,y, WalkingSpeed/2, 0);
            phy_speed_x  = min(phy_speed_x, maxWalkingSpeed/2);
        }
    }
}*/

if(sliding && grounded)
{
    if(slideCounter == slideTime)
    {
        if(left)
        {
            physics_apply_local_force(x,y, -slideSpeed, 0);
        }
        else if(right)
        {
            physics_apply_local_force(x,y, slideSpeed, 0);
        }
    }
    slideCounter = 0;
    sliding = false;
}
else
{
    //if you take off the ground, stop sliding
    slideCounter = 0;
    sliding = false;
}

if(!sliding && slideCounter != slideTime)
{
    slideCounter++;
}

if(jump && grounded)
{
    physics_apply_local_impulse(x,y, 0, baseJumpSpeed);
    grounded = false;
}

if( !moving && grounded )
{
     /*if(phy_speed_x < 1 || phy_speed_x > 1)
    {
        phy_speed_x = 0;
    }*/
}

