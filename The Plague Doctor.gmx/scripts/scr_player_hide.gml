//------------------------------------------------HIDING

if (grounded 
    && place_meeting(x, y, obj_crate)
    && down) 
{
    hidden = true;
}   
else 
{
    hidden = false;
}
