//------------------------------------------------GRABBING ON GRAB WALLS


if(place_meeting(x, y, obj_grabBlock)) { grabbing = true; }

if (grabbing) 
{
    g = 0;
    
    //Deccelerate into grab
    if (v_y > 0) 
    { 
        v_y -= 2; 
    } 
    else 
    { 
        v_y = 0; 
    }
    
    if (jump || !place_meeting(x, y, obj_grabBlock)) 
    {
        grabbing = false;
        v_y = 0;
        g = 2;
    }
}


