///scr_enemy_choose_state()

if (alarm[0] = -1 && !follow) {
    state = choose(scr_enemy_move_state, scr_enemy_idle_state);
    move = choose(-1, 1, 0);
    alarm[0] = room_speed * random_range(.4, .7);  
}
