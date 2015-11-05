/* finds out of an item exists and returns a boolean */
item = argument0;
var count;

for (var i = 0; i < global.inventorySize; i++) {
    if (global.ammo[i] == item) {
        count++;
    }
}
return count;
