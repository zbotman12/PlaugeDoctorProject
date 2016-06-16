if(grounded)
{
    if(rightAndLeftPressed)
    {
        //
    }
    else if(left)
    {
        image_xscale = -1 * abs(image_xscale);
        if(runButton)
        {
            physics_apply_force(x,y, -RunningSpeed, RunningSlopeScanValue);
            phy_speed_x  = max(phy_speed_x, -maxRunningSpeed);    
        }
        else
        {
            physics_apply_force(x,y, -WalkingSpeed, slopeScanValue);
            phy_speed_x  = max(phy_speed_x, -maxWalkingSpeed);
        }
    }
    else if (right)
    {
        image_xscale = abs(image_xscale);
        if(runButton)
        {
            physics_apply_force(x,y, RunningSpeed, RunningSlopeScanValue);
            phy_speed_x  = min(phy_speed_x, maxRunningSpeed);    
        }
        else
        {
            physics_apply_force(x,y, WalkingSpeed, slopeScanValue);
            phy_speed_x  = min(phy_speed_x, maxWalkingSpeed);
        }
    }
}
else
{
    if(rightAndLeftPressed)
    {
        //
    }
    else if(left)
    {
        image_xscale = -1 * abs(image_xscale);
        if(runButton)
        {
            physics_apply_force(x,y, -RunningSpeed, 1);
            phy_speed_x  = max(phy_speed_x, -maxRunningSpeed);    
        }
        else
        {
            physics_apply_force(x,y, -WalkingSpeed, 0);
            phy_speed_x  = max(phy_speed_x, -maxWalkingSpeed);
        }
    }
    else if (right)
    {
        image_xscale = abs(image_xscale);
        if(runButton)
        {
            physics_apply_force(x,y, RunningSpeed, 1);
            phy_speed_x  = min(phy_speed_x, maxRunningSpeed);    
        }
        else
        {
            physics_apply_force(x,y, WalkingSpeed, 0);
            phy_speed_x  = min(phy_speed_x, maxWalkingSpeed);
        }
    }

}

if(jump && grounded)
{
    physics_apply_impulse(x, y, 0, baseJumpSpeed);
    grounded = false;
}
