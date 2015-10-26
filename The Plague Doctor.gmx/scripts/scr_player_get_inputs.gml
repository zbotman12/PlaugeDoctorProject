/// scr_player_get_inputs()

right = keyboard_check(vk_right) || keyboard_check(ord("D"));
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
rightAndLeftPressed = (keyboard_check(vk_right) || keyboard_check(ord("D"))) && (keyboard_check(vk_left) || keyboard_check(ord("A")));
runButton = keyboard_check(vk_lshift);
up = keyboard_check(vk_up) || keyboard_check(ord("W"));
down = keyboard_check(vk_down) || keyboard_check(ord("S"));
