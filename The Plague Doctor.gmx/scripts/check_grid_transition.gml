///check_grid_transition(-1 for up or 1 for down). Returns true if transition is happening.
if(containerToOpen != noone)
{
    if(argument0 == -1){ //Up
        //If you are in the container, below the inventory
        if((selectionBoxCurrentGrid == containerGrid) && (selectionBoxCellY <= 0))
        {
            selectionBoxCurrentGrid = invGrid;
            return true;
        }else{
            return false;
        }
    }else{ //Down
        //If you are in the inventory, above the container, and press down
        if(selectionBoxCurrentGrid == invGrid && selectionBoxCellY >= (kitSizeY - 1))
        {
            selectionBoxCurrentGrid = containerGrid;
            return true;
        }else{
            return false;
        }
    }
}else{
    return false;
}
