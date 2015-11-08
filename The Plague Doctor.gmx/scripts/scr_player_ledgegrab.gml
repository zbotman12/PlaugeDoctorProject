g = 0;

//Deccelerate into grab
if (v_y > 0) { 
    v_y -= 2; 
} else { 
    v_y = 0; 
}

if (jump || !place_meeting(x, y, obj_grabBlock)) 
{
    v_y = 0;
    g = 2;
    state = states.normal;
}
scr_player_collision(obj_wall);

