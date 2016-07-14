var gridLocationX = argument0;
var gridLocationY = argument1;
var itemType = argument2;

if(gridLocationX > kitSizeX)
{
    gridLocationX = kitSizeX;
}

if(gridLocationY > kitSizeY)
{
    gridLocationY = kitSizeY;
}

var displayLocationX = gridStartX + gridLocationX * INV_CELL_SIZE;
var displayLocationY = gridStartY + gridLocationY * INV_CELL_SIZE;

item = instance_create(displayLocationX, displayLocationY, itemType);

with (item)
{
gridX = gridLocationX;
gridY = gridLocationY;
display_x = displayLocationX;
display_y = displayLocationY;
}

return(item);
