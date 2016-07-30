///pack_inventory_grid(ds_listOfObjectIDsToPack, ds_gridToPack)
listOfObjects = argument0;
gridToPack = argument1;
if(ds_exists(listOfObjects, ds_type_list) && !ds_list_empty(listOfObjects) && ds_exists(gridToPack, ds_type_grid)){
    for(var itemIndex = 0; itemIndex < ds_list_size(listOfObjects); itemIndex++){
        var foundPlace = false;
        if(object_exists(listOfObjects[| itemIndex]) && object_get_parent(listOfObjects[| itemIndex]) == obj_item_parent){
            var numCellsX = floor(sprite_get_width(object_get_sprite(listOfObjects[| itemIndex]))/ INV_CELL_SIZE) - 1;
            var numCellsY = floor(sprite_get_height(object_get_sprite(listOfObjects[| itemIndex]))/ INV_CELL_SIZE) - 1;
            for(var cellX = 0; cellX < (ds_grid_width(gridToPack) - numCellsX); cellX++){
                for(var cellY = 0; cellY < (ds_grid_height(gridToPack) - numCellsY); cellY++){
                    if(ds_grid_get_mean(gridToPack, cellX, cellY, cellX + numCellsX, cellY + numCellsY) == noone){
                        ds_grid_set_region(gridToPack, cellX, cellY, cellX + numCellsX, cellY + numCellsY, listOfObjects[| itemIndex]);
                        foundPlace = true;
                        break;
                    }
                }
                if(foundPlace){ 
                    break;
                }
            }
            if(!foundPlace){
                show_message("WARNING: container with box ID '" + boxId + "' did not have enough space to spawn item number '" + string(itemIndex) + "' which was a(n) '" + object_get_name(listOfObjects[| itemIndex]) + "'.");
            }
        }
    }
    ds_list_clear(listOfObjects);
    ds_list_destroy(listOfObjects);
    return true;
}else{
    return false;
}
