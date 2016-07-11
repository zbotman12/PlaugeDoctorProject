var gamepadHor,gamepadVert,gamepadAReleased,gamepadAPressed,gamepadBPressed,gamepadXPressed,gamepadYPressed,
gamepadA,gamepadB,gamepadX,gamepadY,gamepadDpadUpPressed,gamepadDpadDownPressed,gamepadDpadLeftPressed,
gamepadDpadRightPressed,gamepadDpadUp,gamepadDpadDown,gamepadDpadLeft,gamepadDpadRight,gamepadStart,gamepadLT = 0;

if (gamepad_is_connected(0)) //Maybe we want any controller, 0 - 3, to work, just a thought.
{ 
    gamepad_set_axis_deadzone(0, 0.5);
    gamepadHor = sign(gamepad_axis_value(0, gp_axislh));
    gamepadVert = sign(gamepad_axis_value(0, gp_axislv));
   
    //FACEBUTTONS 
    gamepadAReleased = gamepad_button_check_released(0, gp_face1);
    gamepadAPressed = gamepad_button_check_pressed(0, gp_face1);
    gamepadBPressed = gamepad_button_check_pressed(0, gp_face2);
    gamepadXPressed = gamepad_button_check_pressed(0, gp_face3);
    gamepadYPressed = gamepad_button_check_pressed(0, gp_face4);
    gamepadA = gamepad_button_check(0, gp_face1);
    gamepadB = gamepad_button_check(0, gp_face2);
    gamepadX = gamepad_button_check(0, gp_face3);
    gamepadY = gamepad_button_check(0, gp_face4);

    //DPAD
    gamepadDpadUpPressed = gamepad_button_check_pressed(0, gp_padu);
    gamepadDpadDownPressed = gamepad_button_check_pressed(0, gp_padd);
    gamepadDpadLeftPressed = gamepad_button_check_pressed(0, gp_padl);
    gamepadDpadRightPressed = gamepad_button_check_pressed(0, gp_padr);
    gamepadDpadUp = gamepad_button_check(0, gp_padu);
    gamepadDpadDown = gamepad_button_check(0, gp_padd);
    gamepadDpadLeft = gamepad_button_check(0, gp_padl);
    gamepadDpadRight = gamepad_button_check(0, gp_padr);
    
    gamepadStart = gamepad_button_check_pressed(0, gp_start);
    gamepadLT = gamepad_button_check(0, gp_shoulderlb);
    
    gamepad = true;
     
    //gamepad = gamepadHor || gamepadHor || gamepadAPressed || gamepadBPressed || gamepadXPressed || gamepadYPressed || gamepadDpadUpPressed ||
   //gamepadDpadDownPressed || gamepadDpadLeftPressed || gamepadDpadRightPressed || gamepadStart || gamepadLT;
}else{
    gamepad = false;
}
//Keyboard Inputs
var keyboardMbLeft = mouse_check_button_pressed(mb_left);
var keyboardRight = keyboard_check(ord("D"));
var keyboardLeft = keyboard_check(ord("A"));
var keyboardUp = keyboard_check(ord("W"));
var keyboardUpPressed = keyboard_check_pressed(ord("W"));
var keyboardDown = keyboard_check(ord("S"));
var keyboardDownPressed = keyboard_check_pressed(ord("S"));
var keyboardShift = keyboard_check(vk_lshift) || keyboard_check(vk_rshift);
var keyboardControl = keyboard_check(vk_control);
var keyboardControlPressed = keyboard_check_pressed(vk_control);
var keyboardJump = keyboard_check(vk_space);
var keyboardJumpPressed = keyboard_check_pressed(vk_space);
var keyboardJumpReleased = keyboard_check_released(vk_space);
var keyboardInteractPressed = keyboard_check_pressed(ord("E"));
var keyboardEscape = keyboard_check_pressed(vk_escape);
var keyboardArrowUp = keyboard_check_pressed(vk_up);
var keyboardArrowDown = keyboard_check_released(vk_down);
var keyboardArrowLeft = keyboard_check_pressed(vk_left);
var keyboardArrowRight = keyboard_check_pressed(vk_right);

/*if(keyboardMbLeft || 
keyboardRight || 
keyboardLeft ||
keyboardShift || 
keyboardControlPressed || 
keyboardJumpPressed ||
keyboardUpPressed ||
keyboardDownPressed ||
keyboardInteractPressed) gamepad = false;*/

leftClick = keyboardMbLeft || gamepadAPressed;
right = keyboardRight || (gamepadHor == 1);
left = keyboardLeft || (gamepadHor == -1);
up = keyboardUp || (gamepadVert == -1);
down = keyboardDown || (gamepadVert == 1);
runButton = keyboardShift || gamepadLT;
crouchButton = keyboardControl || gamepadB;
crouchButtonPressed = keyboardControlPressed || gamepadBPressed;
jump = keyboardJump || gamepadA;
jumpReleased = keyboardJumpReleased || gamepadAReleased;
upPressed = keyboardUpPressed || (gamepadVert == -1);
downPressed = keyboardDownPressed || (gamepadVert == 1);
interactPressed =  keyboardInteractPressed || gamepadXPressed;
pauseButton = keyboardEscape || gamepadStart;
rightAndLeftPressed = right && left;

arrowUp = gamepadDpadUpPressed || keyboardArrowUp;
arrowDown = gamepadDpadDownPressed || keyboardArrowDown;
arrowLeft = gamepadDpadLeftPressed || keyboardArrowLeft;
arrowRight = gamepadDpadRightPressed || keyboardArrowRight;
