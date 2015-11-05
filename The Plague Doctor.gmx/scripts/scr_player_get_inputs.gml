/// scr_player_get_inputs()

//Movement
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
runButton = keyboard_check(vk_lshift);
jump = keyboard_check_pressed(vk_space);
rightAndLeftPressed = keyboard_check(ord("D")) && keyboard_check(ord("A"));

//Action
click = mouse_check_button_pressed(mb_left);

