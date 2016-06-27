if (gamepad_is_connected(0)) //Maybe we want any controller, 0 - 3, to work, just a thought.
{ 
    gamepad_set_axis_deadzone(0, 0.1);
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
}

//Keyboard Inputs
leftClick = mouse_check_button_pressed(mb_left) || gamepadAPressed;
right = keyboard_check(ord("D")) || (gamepadHor == 1);
left = keyboard_check(ord("A")) || (gamepadHor == -1);
up = keyboard_check(ord("W")) || (gamepadVert == 1);
down = keyboard_check(ord("S")) || (gamepadVert != -1);
runButton = keyboard_check(vk_lshift) || gamepadLT;
crouchButton = keyboard_check(vk_control) || gamepadB;
crouchButtonPressed = keyboard_check_pressed(vk_control) || gamepadBPressed;
jump = keyboard_check(vk_space) || gamepadA;
jumpReleased = keyboard_check_released(vk_space) || gamepadAReleased;
rightAndLeftPressed = right && left;

