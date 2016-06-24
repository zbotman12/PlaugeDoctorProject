///Detect the angle of the slope under the players feet and angle the sprite to sit on that angle

var collisionPointX = 0;
var collisionPointY = bbox_bottom;
backfootPointX = 0;
backfootPointY = bbox_bottom;


/*if( slopeBeneathFeet != noone && sign(slopeBeneathFeet.image_xscale) == -1) //Get the sign of the slope under your feet
{
    collisionPointX = bbox_left;
    backfootPointX = bbox_right;
}else
{
    collisionPointX = bbox_right;
    backfootPointX = bbox_left;
}
rayHitPointX = backfootPointX;
rayHitPointY = backfootPointY;
if(scr_castRay(backfootPointX, backfootPointY, 270, obj_collision_slope, 96, 3))
{
    phy_rotation = point_distance(backfootPointX, backfootPointY,rayHitPointX,rayHitPointY )/(sprite_width * abs(image_xscale));
}
