var inst;

inst = instance_nearest((sign(hsp) * 100) + x, y, obj_player);

if ((abs(obj_player.x - x) < 50) && (abs(obj_player.y - y) < 150) && (inst == obj_player.id)) {
    follow = true;
} 
else {
    follow = false;
}

    
if(follow == true)
{   
    if(obj_player.x > x)
    {
        key_left = 0;
        key_right = 1;
    }else if(obj_player.x < x)
    {
        key_left = -1;
        key_right = 0;
    }
    
    if (place_meeting(x, y, obj_wall) && obj_player.y > y) {
        if (obj_player.x > x) {
            key_left = 0;
            key_right = 1;
            }
        else if(obj_player.x < x) {
            key_left = 1;
            key_right = 0;
        }
    }
    
   
}

if (abs(obj_player.x - x) > 200 && abs(obj_player.y - y) > 200) {
    follow = false;
    with(obj_spotted) {
        instance_destroy();
    }
}

    

//TEMPORARILY DISABLE MOVEMENT
//if(!follow){
//key_left = 0;
//key_right = 0;
//}
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav; 


//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
    while(!place_meeting(x+sign(hsp),y,obj_wall))
        {
            x += sign(hsp);
        }
        hsp = 0;
    if(!follow){
        if(!key_right)
        {
            key_right = 1;
            key_left = 0; 
        }else{
            key_right = 0;
            key_left = -1; 
        }
    }
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
    while(!place_meeting(x,y+sign(vsp),obj_wall))
        {
            y += sign(vsp);
        }
        vsp = 0;
        if(hsp == 0 && follow == true){
            vsp -= jumpspeed;
        }
}


y += vsp;


//Controling the sprite turning

if(key_left == -1)
{
image_xscale = 1;
sightboxInst.image_xscale = 1;
}

if(key_right)
{
image_xscale = -1;
sightboxInst.image_xscale = -1;
}

