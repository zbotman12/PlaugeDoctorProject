///spawn_gui_item(gridLocationX, gridLocationY, itemType, gridId)
var gridLocationX = argument0;
var gridLocationY = argument1;
var itemType = argument2;
var gridId = argument3;

if(gridId == invGrid){
    var displayLocationX = gridStartX + gridLocationX * INV_CELL_SIZE;
    var displayLocationY = gridStartY + gridLocationY * INV_CELL_SIZE;
}else{
    var displayLocationX = containerStartX + gridLocationX * INV_CELL_SIZE;
    var displayLocationY = containerStartY + gridLocationY * INV_CELL_SIZE;
}

item = instance_create(displayLocationX, displayLocationY, itemType);

with (item)
{
gridX = gridLocationX;
gridY = gridLocationY;
display_x = displayLocationX;
display_y = displayLocationY;
currentGrid = gridId;
}

return(item);
