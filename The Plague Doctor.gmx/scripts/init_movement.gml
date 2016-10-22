//Buttons
right = false;
left = false;
up = false;
down = false;
upPressed = false;
downPressed = false;
rightAndLeftPressed = false;
grounded = false;
hidden = false;
runButton = false;
leftClick = false;
leftClickReleased = false;
lastDir = 0;
jump = false;
interactPressed = false;
arrowUp = false;
arrowDown = false;
arrowLeft = false;
arrowRight = false;
arrowUpRelease = 0;
arrowDownRelease = 0;
arrowLeftRelease = 0;
arrowRightRelease = 0;

lastDirTSRHor = 0;
lastDirTSLHor = 0;
lastDirTSRVert = 0;
lastDirTSLVert = 0;

//kinematics
gamespeed = 2;
/*KNOBS*/
spd = 10 / gamespeed;
runSpd = 16 / gamespeed;
crawlSpd = 6 / gamespeed;
hAccConst = 2 / gamespeed;
turnDelayTime = 3 * gamespeed;
runTurnDelayTime = 8 * gamespeed;
grav = 2 / gamespeed;
terminalVel = 30 / gamespeed;
jspd = 20 / gamespeed;
gravIgnoreTime = 12 * gamespeed;
baseGravIgnoreTime = 8 * gamespeed;
slideSpeed = 50 / gamespeed;
slideDecayAmmount = 4 / gamespeed;
ladderspd = 5 / gamespeed;
jumplag = 6 * gamespeed;
/*END KNOBS*/

hspd = 0;
vspd = 0;
gravIgnoreTimer = gravIgnoreTime;
jumplagTimer = 0;
jumped = false;
turnDelayTimer = 0;
lastkey = 0;
sliding = false;
slideDecay = false;
jumpReleased = false;
