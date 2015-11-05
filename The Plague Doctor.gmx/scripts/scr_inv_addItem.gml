/* Adds items to inventory
    0 is a bullet
    1 is a key */
item = argument0;

for (var i = 0; i < global.inventorySize; i++) {
    if (global.ammo[i] == -1) {
        global.ammo[i] = item; 
        global.itemCount++;  
        break;
    }
}
