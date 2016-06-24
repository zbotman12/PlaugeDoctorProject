/*
Args:
    argument0 = x origin
    argument1 = y origin
    argument2 = angle at which the ray is running (real)
    argument3 = object the ray is seeking (object name)
    argument4 = maximum distance the ray will travel (real)
    argument5 = chunk size. The length of lines the ray is divided (real)


Return:
    true  = if the ray hit something
    false = if the ray wiffs
    
    - This function modifies the values of variables rayHitPointX and rayHitPointY 
      to represent the point in the room where the ray collided with an instance 
      of the given object.
*/

var i, a, CheckX ,CheckY, originX, originY, lineChunkX, lineChunkY;

originX=argument0;
originY=argument1;
rayAngle = argument2;
objToScanFor = argument3;
MaxDistance = argument4;
LineChunkSize = argument5;
lineChunkX = originX;
lineChunkY = originY;


if collision_point(originX,originY,objToScanFor,1,1) //If origin point of ray immediately collides, we exit
{
    rayHitPointX=originX;
    rayHitPointY=originY;
    return true;
}

for (i=1;i<MaxDistance;i+=LineChunkSize) //create a line chunk to check for instances of the object
{
    CheckX=originX+lengthdir_x(i,rayAngle); //Object's X + change in X for line chunk
    CheckY=originY+lengthdir_y(i,rayAngle); //Object's Y + change in Y for line chunk
    if collision_line(lineChunkX,lineChunkY,CheckX,CheckY,objToScanFor,1,1) //if our line collides with an instance 
    {
        for (a=i-LineChunkSize;a<MaxDistance;a+=1) //Jump back 1 line chunk, and then Check for the point of collision along the rest the ray
        {
            CheckX=x+lengthdir_x(a,rayAngle);
            CheckY=y+lengthdir_y(a,rayAngle);
            if collision_point(CheckX,CheckY,objToScanFor,1,1)
            {
                rayHitPointX=CheckX;
                rayHitPointY=CheckY;
                return true;
            }
        }
    }
    lineChunkX=CheckX;
    lineChunkY=CheckY;
}
rayHitPointX=CheckX;
rayHitPointY=CheckY;
return false;
