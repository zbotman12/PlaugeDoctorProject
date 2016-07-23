///init_containers(RoomToInitContainersFor)
RoomToInitContainersFor = string(argument0);

var global.containerfname = "containers";
ini_open(global.containerfname);

initContainerList = ds_list_create();

ds_list_add(initContainerList, obj_item_1, 0, 0, noone);
ds_list_add(initContainerList, obj_item_2, 1, 1, noone);

var str = ds_list_write(initContainerList);
ini_write_string(RoomToInitContainersFor, "box1", str);

ds_list_clear(initContainerList);

ds_list_add(initContainerList, obj_item_2, 0, 0, noone);
var str = ds_list_write(initContainerList);
ini_write_string(RoomToInitContainersFor, "box2", str);

ds_list_clear(initContainerList);

ds_list_add(initContainerList, obj_item_1, 0, 0, noone);
ds_list_add(initContainerList, obj_item_1, 0, 1, noone);
ds_list_add(initContainerList, obj_item_1, 0, 2, noone);
ds_list_add(initContainerList, obj_item_1, 0, 3, noone);
ds_list_add(initContainerList, obj_item_1, 0, 4, noone);
ds_list_add(initContainerList, obj_item_1, 0, 5, noone);
var str = ds_list_write(initContainerList);
ini_write_string(RoomToInitContainersFor, "box3", str);

ds_list_clear(initContainerList);

ds_list_add(initContainerList, obj_item_3, 2, 6, noone);
ds_list_add(initContainerList, obj_item_3, 3, 2, noone);
var str = ds_list_write(initContainerList);
ini_write_string(RoomToInitContainersFor, "box4", str);

ds_list_clear(initContainerList);
;
ds_list_add(initContainerList, obj_item_2, 2, 2, noone);
ds_list_add(initContainerList, obj_item_1, 0, 0, noone);
ds_list_add(initContainerList, obj_item_1, 0, 1, noone);
var str = ds_list_write(initContainerList);
ini_write_string(RoomToInitContainersFor, "box5", str);

ds_list_clear(initContainerList);
ds_list_destroy(initContainerList);
ini_close();
