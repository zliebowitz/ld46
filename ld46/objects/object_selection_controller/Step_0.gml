/// @description Insert description here
// You can write your code in this editor

arr[idx].selected = false;

if keyboard_check_pressed(vk_left)
{
	// somehow I don't want to find out what weird things game maker does with modulo of negatives
	idx += array_length_1d(arr) - 1;
	idx %= array_length_1d(arr);
	audio_play_sound(sound_title_select_fx, 10, false);
}

if keyboard_check_pressed(vk_right)
{
	idx += 1;
	idx %= array_length_1d(arr);
	audio_play_sound(sound_title_select_fx, 10, false);
}

arr[idx].selected = true;

if keyboard_check_pressed(vk_enter)
{
		if arr[idx] = object_start
			room_goto(room_boss_fight_2);
		else if arr[idx] = object_exit
			game_end();
		else if arr[idx] = object_pause_no
			room_goto(room_boss_fight)
		else if arr[idx] = object_pause_yes
			room_goto(room_title);
}