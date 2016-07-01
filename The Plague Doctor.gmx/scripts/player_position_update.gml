///player_position_update(horizontalSpeed, VerticalSpeed)
//Collision detection and position change
hspd = argument0;
vspd = argument1;


if(place_meeting(x + hspd, y, obj_collision_box)){
    while(!place_meeting(x+sign(hspd), y, obj_collision_box)){
        x += sign(hspd);
    }
    hspd = 0;
}

x += hspd;

if(place_meeting(x, y + vspd, obj_collision_box)){
    while(!place_meeting(x, y+sign(vspd), obj_collision_box)){
        y += sign(vspd);
    }
    vspd = 0;
}else if((/*vspd > 0 &&*/ instance_place(x, y + vspd, obj_one_way_floor) != noone) && (instance_place(x, y + vspd, obj_one_way_floor).playerCollidable == true)){
        while(!place_meeting(x, y+1, obj_one_way_floor)){
            y += 1;
        }
        vspd = 0;
}

y += vspd;
