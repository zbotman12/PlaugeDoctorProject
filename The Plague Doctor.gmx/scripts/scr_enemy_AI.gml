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

scr_enemy_choose_state();
