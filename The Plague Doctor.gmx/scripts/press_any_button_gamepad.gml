///Checks to see if any button is pressed on the gamepad
var gamepadHor  = false;
var gamepadVert = false;
var gamepadAReleased = false;
var gamepadAPressed = false;
var gamepadBPressed = false;
var gamepadXPressed = false;
var gamepadYPressed = false;
var gamepadDpadUpPressed = false;
var gamepadDpadDownPressed = false;
var gamepadDpadLeftPressed = false;
var gamepadDpadRightPressed = false;
var gamepadStart = false;
var gamepadLT = false;
var gamepadLT2 = false;
var gamepadRT = false;
var gamepadRT2 = false;
var gamepad = false;
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

    //DPAD
    gamepadDpadUpPressed = gamepad_button_check_pressed(0, gp_padu);
    gamepadDpadDownPressed = gamepad_button_check_pressed(0, gp_padd);
    gamepadDpadLeftPressed = gamepad_button_check_pressed(0, gp_padl);
    gamepadDpadRightPressed = gamepad_button_check_pressed(0, gp_padr);
    
    gamepadStart = gamepad_button_check_pressed(0, gp_start);
    gamepadLT = gamepad_button_check(0, gp_shoulderlb);
    gamepadLT2 = gamepad_button_check(0, gp_shoulderl);
    gamepadRT = gamepad_button_check(0, gp_shoulderrb);
    gamepadRT2 = gamepad_button_check(0, gp_shoulderr);
    
    gamepad = gamepadHor || gamepadHor || gamepadAPressed || gamepadBPressed || gamepadXPressed || gamepadYPressed || gamepadDpadUpPressed ||
    gamepadDpadDownPressed || gamepadDpadLeftPressed || gamepadDpadRightPressed || gamepadStart || gamepadLT || gamepadLT2 || gamepadRT || gamepadRT2;
}

return gamepad;
