/*----------------------------------------
  ____  ____  ____  ___ _____ _____ ____  
 / ___||  _ \|  _ \|_ _|_   _| ____/ ___| 
 \___ \| |_) | |_) || |  | | |  _| \___ \ 
  ___) |  __/|  _ < | |  | | | |___ ___) |
 |____/|_|   |_| \_\___| |_| |_____|____/

----------------------------------------*/

if (grounded) { // sprites when grounded

    if (runButton && (right || left)) {
    
        /** if the sprite isn't the running sprite set index to zero so when 
          * it becomes the running sprite, it always starts on frame 0 */
        if (sprite_index != spr_running) {  
            image_index = 0;
        }
        
        sprite_index = spr_running;
        image_speed = 3;
    }
    else if ((left || right)) { // if no horizontal speed
    
        if (sprite_index != spr_walking) { // same as before
            image_index = 0;
        }
        
        sprite_index = spr_walking;
        image_speed = 4;
    }
    else { // if none of the above, then make player idle.
        sprite_index = spr_idle;
        image_speed = 1;
    }
    
    if (rightAndLeftPressed) { //both pressed
        sprite_index = spr_idle;
        image_speed = 1;
    }
}
else { // if not grounded...

    if (v_y > 0) {
        if (sprite_index != spr_falling) {
            image_index = 0;
        }
        
    sprite_index = spr_falling; // this has a script in "animation end" to avoid looping
    image_speed = 0.5;
    }
    
    if (v_y < 0) {
        sprite_index = spr_idle;
        image_speed  = 1;
    }
}

