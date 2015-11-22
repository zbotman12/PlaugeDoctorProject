/*
Args:
    argument0 = angle at which the ray is running (real)
    argument1 = object the ray is seeking (object name)
    argument2 = maximum distance the ray will travel (real)
    argument3 = chunk size. The length of lines the ray is divided (real)

Return:
    true  = if the ray hit something
    false = if the ray wiffs
    
    - This function modifies the values of variables rayHitPointX and rayHitPointY 
      to represent the point in the room where the ray collided with an instance 
      of the given object.
*/

var i, a, CheckX ,CheckY, originX, originY;

originX=x;
originY=y;

if collision_point(x,y,argument1,1,1) //If origin point of ray immediately collides, we exit
{
rayHitPointX=x;
rayHitPointY=y;
return true;
}

for (i=1;i<argument2;i+=argument3) //create a line chunk to check for instances of the object
{
    CheckX=x+lengthdir_x(i,argument0); //Object's X + change in X for line chunk
    CheckY=y+lengthdir_y(i,argument0); //Object's Y + change in Y for line chunk
    if collision_line(originX,originY,CheckX,CheckY,argument1,1,1) //if our line collides with an instance 
    {
        for (a=i-argument3;a<argument2;a+=1) //Jump back 1 line chunk, and then Check for the point of collision along the rest the ray
        {
            CheckX=x+lengthdir_x(a,argument0);
            CheckY=y+lengthdir_y(a,argument0);
            if collision_point(CheckX,CheckY,argument1,1,1)
            {
                rayHitPointX=CheckX;
                rayHitPointY=CheckY;
                return true;
            }
        }
    }
    originX=CheckX;
    originY=CheckY;
}
rayHitPointX=originX;
rayHitPointY=originY;
return false;
