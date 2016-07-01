///change_sprite(newSpriteIndex, imageSpeed, resetAnimation, flipSpriteToDirection)
newSpriteIndex = argument0;
imageSpeed = argument1;
resetAnimation = argument2;
flipSpriteToDirection = argument3;

if(flipSpriteToDirection){
    if(right){
        image_xscale = abs(image_xscale);
    }else if (left){
        image_xscale = -abs(image_xscale);
    }
}

if (sprite_index != newSpriteIndex && resetAnimation)
{  
    image_index = 0;
}  
sprite_index = newSpriteIndex;
image_speed = imageSpeed;


