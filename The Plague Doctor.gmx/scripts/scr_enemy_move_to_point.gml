pointX = argument0;
pointY = argument1;
//This is a range of X values that the character is trying to reach.
//If he is NOT within that range, keep moving toward the range until he is.
if(!(x <= pointX + movespeed + 1 && x >= pointX - movespeed + 1)){ 
    var dir = sign(pointX - x);
    move = dir;
    v_x = move * movespeed;
}
