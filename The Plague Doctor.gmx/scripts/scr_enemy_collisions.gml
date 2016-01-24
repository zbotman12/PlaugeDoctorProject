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
        if(move == -1)
        {
            move = 1;
        }else{
            move = -1;
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
        if(hsp == 0 && follow){
            vsp -= jumpspeed;
        }
}


y += vsp;


//Controling the sprite turning

if(sign(hsp) == 1)
{
image_xscale = -1;
}

if(sign(hsp) == -1)
{
image_xscale = 1;
}

