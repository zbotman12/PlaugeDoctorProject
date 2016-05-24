if (mouse_check_button_pressed(mb_left) && trackMouse == true){
    trackMouse = false;
    place = true;
}
if (trackMouse){
    x = mouse_x;
    y = mouse_y;
    if(obj_invgrid.itemSelected == noone) obj_invgrid.itemSelected = self.id;
    for(var cellY = 0; cellY < numCellsY; cellY++){
        for(var cellX = 0; cellX < numCellsX; cellX++){
            obj_invgrid.invGrid[# currentCellX + cellX, currentCellY + cellY] = 0;
        }
    }
}else if (place){
    var snapX = x - obj_invgrid.x;
    var snapY = y - obj_invgrid.y;
    if(snapX < 0) snapX = 0;
    if(snapY < 0) snapY = 0;
    
    snapX = floor(snapX/INV_CELL_SIZE);
    snapY = floor(snapY/INV_CELL_SIZE);
    
    if(snapX > obj_invgrid.kitSizeX){
        snapX = obj_invgrid.kitSizeX - 1;
    }
    
    if(snapY > obj_invgrid.kitSizeY){
        snapY = obj_invgrid.kitSizeY - 1;
    }
    
    if(snapX + numCellsX > obj_invgrid.kitSizeX || snapY + numCellsY > obj_invgrid.kitSizeY){
        //item cannot fit, put it back on the mouse and exit
        trackMouse = true;
        exit;
    }
    
    for(var cellY = 0; cellY < numCellsY; cellY++){
        for(var cellX = 0; cellX < numCellsX; cellX++){
            //If the item would overlap another item, put it back on the mouse and exit
            if(obj_invgrid.invGrid[# snapX + cellX, snapY + cellY] == 1){
                trackMouse = true;
                exit;
            }
        }
    }
    
    for(var cellY = 0; cellY < numCellsY; cellY++){
        for(var cellX = 0; cellX < numCellsX; cellX++){
            obj_invgrid.invGrid[# snapX + cellX, snapY + cellY] = 1;
        }
    }
    
    x = snapX * INV_CELL_SIZE + obj_invgrid.x;
    y = snapY * INV_CELL_SIZE + obj_invgrid.y;
    currentCellX = snapX;
    currentCellY = snapY;
    obj_invgrid.itemSelected = noone;
    place = false;
}
