if (gamepad_is_connected(0))
{ 
    gamepad_set_axis_deadzone(0, 0.1);
    gamepadHor = sign(gamepad_axis_value(0, gp_axislh));
    gamepadVert = sign(gamepad_axis_value(0, gp_axislv));
    gamepadStart = gamepad_button_check_pressed(0, gp_start);
    gamepadA = gamepad_button_check_pressed(0, gp_face1);
    gamepadX = gamepad_button_check_pressed(0, gp_face2);
    gamepadY = gamepad_button_check_pressed(0, gp_face3);
    gamepadB = gamepad_button_check_pressed(0, gp_face4);
    gamepadLT = gamepad_button_check(0, gp_shoulderlb);   
}

//Keyboard Inputs
leftClick = mouse_check_button_pressed(mb_left);
right = keyboard_check(ord("D")) || (gamepadHor == 1);
left = keyboard_check(ord("A")) || (gamepadHor == -1);
up = keyboard_check(ord("W")) || (gamepadVert == 1);
down = keyboard_check(ord("S")) || (gamepadVert != -1);
runButton = keyboard_check(vk_lshift) || gamepadLT;
jump = keyboard_check_pressed(vk_space) || gamepadA;
rightAndLeftPressed = right && left;

