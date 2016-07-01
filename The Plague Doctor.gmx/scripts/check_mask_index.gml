///check_mask_index(xPosition, yPosition, mask_index). Returns false if mask would intersect a wall object, true otherwise
xPosition = argument0;
yPosition = argument1;
new_mask_index = argument2; //A sprite index to use as the new collision mask

last_mask_index = mask_index;
mask_index = new_mask_index;

if(place_meeting(xPosition,yPosition,obj_collision_box)){
    mask_index = last_mask_index;
    return false;
}else{
    mask_index = last_mask_index;
    return true;
}
