floorObject = argument0; 
//------------------------------------------------X-AXIS AND UPHILL SLOPE COLLISIONS
// If on collision course with the wall...
if (place_meeting(x + v_x, y, floorObject))
{
    yplus = 0;
    while (place_meeting(x + v_x, y - yplus, floorObject) && yplus <= slopeScanValue && grounded)
    {
        yplus += 1;
    }
    if (place_meeting(x + v_x, y - yplus, floorObject))
    {
        while(!place_meeting(x + v_x, y, floorObject))
        {
            x += sign(v_x);
        }
        v_x = 0;
    }
    else if(place_meeting(x + v_x, y - yplus + 1, floorObject))
    {
        y -= yplus;
    }
}
x += v_x * global.timeScale; // Check for collisions first, then update x.
//------------------------------------------------Y-AXIS COLLISIONS
if (place_meeting(x, y + v_y, floorObject))
{
// While you haven't collided yet...
    while(!place_meeting(x, y + sign(v_y), floorObject))
    {
        y += sign(v_y);
    }
    grounded = true;
    // When you collide, set v_y = 0.
    v_y = 0;
}
y += v_y * global.timeScale;
//------------------------------------------------GOING DOWN SLOPES
yminus = 0;
while (!place_meeting(x + v_x, y + yminus, floorObject) && yminus <= slopeScanValue && grounded)
{
    yminus += 1;
}
if (place_meeting(x + v_x, y + yminus, floorObject))
{
    grounded = true;
    y += yminus;
}
else
{
    grounded = false;
}
//------------------------------------------------GRAVITY AND GROUNDED BOOLEAN
// If one pixel above ground, v_y = 0. If space is pressed, jump.
if (!place_meeting(x, y + 1, floorObject) && !climbing)
{
    //g = 2;
    v_y += g;
    grounded = false; // Can't jump when not grounded.
}
