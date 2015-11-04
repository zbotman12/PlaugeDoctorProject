pointX = argument0;

if(!(x <= pointX + movespeed + 1 && x >= pointX - movespeed + 1)){
    var dir = sign(pointX - x);
    move = dir;
    hsp = move * movespeed;
}else if (pointX == path_get_point_x(path, path_get_number(path) - 1) || pointX == path_get_point_x(path, 0)){
    ReversePath = !ReversePath;
    Path = false;
}else{
    Path = false;
}
