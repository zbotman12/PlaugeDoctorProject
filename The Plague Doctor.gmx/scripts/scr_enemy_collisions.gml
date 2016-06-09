wallObj = obj_wall_parent;

if (vsp < 10) vsp += grav * global.timeScale; 

//Horizontal Collision
if (place_meeting(x+hsp,y,wallObj))
{
    while(!place_meeting(x+sign(hsp),y,wallObj))
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
x += hsp * global.timeScale;

//Vertical Collision
if (place_meeting(x,y+vsp,wallObj))
{
    while(!place_meeting(x,y+sign(vsp),wallObj))
        {
            y += sign(vsp);
        }
        vsp = 0;
        if(hsp == 0 && follow){
            vsp -= jumpspeed;
        }
}

y += vsp * global.timeScale;

//Controling the sprite turning

if(sign(hsp) == 1)
{
image_xscale = -1;
}

if(sign(hsp) == -1)
{
image_xscale = 1;
}

