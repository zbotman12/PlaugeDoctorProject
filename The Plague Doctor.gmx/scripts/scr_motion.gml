var velocity = spd;
var jumpVelocity = jspd;
var realTurnDelayTime = turnDelayTime;

if(runButton && crouchButtonPressed && grounded){ //SLIDING
    sliding = true;
}else if(crouchButton){ //CROUCHING
    realTurnDelayTime = 0;
    velocity = 4;
}else if(runButton){ //SPRINTING
    realTurnDelayTime = runTurnDelayTime;
    jumpVelocity = jspd * 1.2;
    velocity = runSpd;
}else{ //IDLE

}

//Gravity and jumping
if(jumpReleased){
    jumped = false;
}
if(place_meeting(x, y + 1, obj_collision_box)){
    grounded = true;
    vspd = 0;
    if(jump && jumped == false && !sliding){
        gravIgnoreTimer = baseGravIgnoreTime;
        vspd = -jumpVelocity;
        jumped = true;
    }
}else{
    grounded = false;
    if(jumped){
        gravIgnoreTimer++;
    }else{
        gravIgnoreTimer = gravIgnoreTime;
    }
    if(vspd < terminalVel && gravIgnoreTimer >= gravIgnoreTime){
        vspd += grav;
    }
}


if(!sliding){
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
}else{
    if(!slideDecay){
        if(right){
            hspd = slideSpeed;
        }
        if(left){
            hspd = -slideSpeed;
        }
        slideDecay = true;
    }else{
        hspd += -sign(hspd) * slideDecayAmmount;
        if(sign(hspd) == -1 && hspd > -slideDecayAmmount){
            hspd = 0;
        }else if(sign(hspd) == 1 && hspd < slideDecayAmmount){
            hspd = 0;
        }
        
        if(hspd == 0){
            sliding = false;
            slideDecay = false;
        }
    }
}

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
}

y += vspd;
