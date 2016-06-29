new_mask_index = argument0; //A sprite index to use as the new collision mask

if (collision_rectangle(x - (sprite_get_width(new_mask_index) / 2),
                        y - sprite_get_height(new_mask_index),
                        x + (sprite_get_width(new_mask_index) / 2),
                        y,
                        obj_collision_box,
                        false,
                        true) == noone){
      mask_index = new_mask_index;
      return true;
}else{
    return false;
}
