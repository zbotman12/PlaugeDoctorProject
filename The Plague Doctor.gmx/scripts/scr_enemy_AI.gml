/*while(sightscan < sightConeLength){
    if(place_meeting(x + sign(image_xscale)*sightscan, y, obj_wall))
    {
        sightDist = sightscan;
        break;
    }
    sightscan++;
}*/


// sightConeVertexArray[ X or Y, point 1-3]
//  |---------------------|  
//  |    x     |    y     |  
//  |---------------------|  
//  |  point1x |  point1y |  
//  |---------------------|         
sightConeVertexArray[0,0] = x;
sightConeVertexArray[1,0] = y - sprite_height/3;
sightConeVertexArray[0,1] = x + lengthdir_x(sightConeLength, image_angle - sightConeAngle);
sightConeVertexArray[1,1] = y + lengthdir_y(sightConeLength, image_angle - sightConeAngle);
sightConeVertexArray[0,2] = x + lengthdir_x(sightConeLength, image_angle + sightConeAngle);
sightConeVertexArray[1,2] = y + lengthdir_y(sightConeLength, image_angle + sightConeAngle);

inst = instance_nearest(sightConeVertexArray[0,0] + sightConeLength, y, obj_wall);

if(inst.y <= sightConeVertexArray[1,0]) //if top of wall is level with or above enemy eyes, they are no longer able to see. 
{
    if (rectangle_in_triangle(
            inst.bbox_left, 
            inst.bbox_top, 
            inst.bbox_right, 
            inst.bbox_bottom, 
            sightConeVertexArray[0,0], 
            sightConeVertexArray[1,0], 
            sightConeVertexArray[0,1],
            sightConeVertexArray[1,1],
            sightConeVertexArray[0,2], 
            sightConeVertexArray[1,2]))
    {
        sightConeLength = sightConeLength - abs(hsp);
    }
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
if(place_meeting(sightConeVertexArray[0,0] + 1, sightConeVertexArray[1,0], obj_wall))
{
    sightConeLength = sprite_width/2;
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
    follow = true;
}
else 
{
    follow = false;
}

    
if(follow == true)
{   
    
    if(obj_player.x > x)
    {
        move = 1;
    }else if(obj_player.x < x)
    {
        move = -1;
    }
    
    if (place_meeting(x, y, obj_wall) && obj_player.y > y) {
        if (obj_player.x > x) {
            move = 1;
            }
        else if(obj_player.x < x) {
            move = -1;
        }
    }
    
   
}

if (abs(obj_player.x - x) > 200 && abs(obj_player.y - y) > 200) {
    follow = false;
}

//scr_enemy_choose_state();
