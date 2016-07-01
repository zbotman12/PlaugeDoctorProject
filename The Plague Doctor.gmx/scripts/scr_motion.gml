///src_motion(Speed, JumpHeight, TurnDelayTime)

var velocity = argument0;
var jumpVelocity = argument1;
var realTurnDelayTime = argument2;

//Gravity and jumping
if(jumpReleased){
    jumped = false;
}
if(place_meeting(x, y + 1, obj_collision_box)){
    grounded = true;
    vspd = 0;
    jumplagTimer = jumplag;
}else if((instance_place(x, y + 1, obj_one_way_floor) != noone) && instance_place(x, y + 1, obj_one_way_floor).playerCollidable == true){
    grounded = true;
    vspd = 0;
    jumplagTimer = jumplag;
}else{
    if(jumped){
        grounded = false;
        gravIgnoreTimer++;
    }
    else if(jumplagTimer == 0){
        grounded = false;
        gravIgnoreTimer = gravIgnoreTime;
    }else{
        jumplagTimer--;
        gravIgnoreTimer = gravIgnoreTime;
    }
    if(vspd < terminalVel && gravIgnoreTimer >= gravIgnoreTime){
        vspd += grav;
    }
}

if(jump && jumped == false && grounded){
        gravIgnoreTimer = baseGravIgnoreTime;
        vspd = -jumpVelocity;
        jumped = true;
    }

if(turnDelayTimer != 0){
    turnDelayTimer--;
}else if(right && !left){
    if(lastkey == "left"){
        hspd = 0;
        turnDelayTimer = realTurnDelayTime;
    }
    else if(hspd < velocity){
        hspd += hAccConst;
    }else{
        hspd = velocity;
    }
    lastkey = "right";
}

if(turnDelayTimer != 0){
    turnDelayTimer--;
}else if(left && !right){
    if(lastkey == "right"){
        hspd = 0;
        turnDelayTimer = realTurnDelayTime;
    }
    else if(hspd > -velocity){
        hspd -= hAccConst;
    }else{
        hspd = -velocity;
    }
    lastkey = "left";
}

if((!right && !left) || (right && left) && hspd != 0){
    if(hspd > 0)
    {
        hspd -= hAccConst;
        if(hspd < hAccConst){
            hspd = 0;
        }
    }else if(hspd < 0){
        hspd += hAccConst;
        if(hspd > hAccConst){
            hspd = 0;
        }
    }
}

player_position_update(hspd,vspd);
