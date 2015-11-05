
if (v_y > 60) { player_hp -= 100; }
if (place_meeting(x, y, obj_wall)) 
{
    if (player_hp <= 0) { room_restart(); }
}
