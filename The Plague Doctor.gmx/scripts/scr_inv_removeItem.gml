/* removes inventory item */
item = argument0;

for (var i = 0; i < global.inventorySize; i++) {
    if (global.ammo[i] == item) {
       global.ammo[i] = -1;
       global.itemCount--;
       break;
    } 
}
