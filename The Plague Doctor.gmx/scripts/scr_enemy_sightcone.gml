//if the player is in the sightcone, return true. Otherwise, return false.

// sightConeVertexArray[ X(0) or Y(1), point 1-3]
//  |---------------------|  
//  |    x     |    y     |  
//  |---------------------|  
//  |  point1x |  point1y |  
//  |---------------------|         
sightConeVertexArray[0,0] = x;
sightConeVertexArray[1,0] = y - sprite_height/3;

sightConeVertexArray[0,1] = x + lengthdir_x(sightConeLength * -1 * image_xscale, image_angle - sightConeAngle);
sightConeVertexArray[1,1] = y + lengthdir_y(sightConeLength, image_angle - sightConeAngle);

sightConeVertexArray[0,2] = x + lengthdir_x(sightConeLength * -1 * image_xscale, image_angle + sightConeAngle);
sightConeVertexArray[1,2] = y + lengthdir_y(sightConeLength, image_angle + sightConeAngle);

if(sign(image_xscale)==1){
    angle = 180;
}else{
    angle = 0;
}

if(scr_castRay(angle, obj_wall, defaultSightConeLength, 10))
{
    sightConeLength =  abs(sightConeVertexArray[0,0] - rayHitPointX);
}
else
{   
    if(sightConeLength < defaultSightConeLength)
    {
        sightConeLength += sightConeGrowthRate;
        if(sightConeLength > defaultSightConeLength)
        {
            sightConeLength = defaultSightConeLength;
        }
    }
}

if (rectangle_in_triangle(
        obj_player.bbox_left, 
        obj_player.bbox_top, 
        obj_player.bbox_right, 
        obj_player.bbox_bottom, 
        sightConeVertexArray[0,0], 
        sightConeVertexArray[1,0], 
        sightConeVertexArray[0,1],
        sightConeVertexArray[1,1],
        sightConeVertexArray[0,2], 
        sightConeVertexArray[1,2]))
{
    playerSpottedCoord[0] = obj_player.x;
    playerSpottedCoord[1] = obj_player.y;
}
else 
{
    playerSpottedCoord[0] = -1;
    playerSpottedCoord[1] = -1;
}

    return playerSpottedCoord;
