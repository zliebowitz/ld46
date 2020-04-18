/// @description Insert description here
// You can write your code in this editor

arr[idx].selected = false;

if keyboard_check_pressed(vk_left)
{
	// somehow I don't want to find out what weird things game maker does with modulo of negatives
	idx += array_length_1d(arr) - 1;
	idx %= array_length_1d(arr);
}

if keyboard_check_pressed(vk_right)
{
	idx += 1;
	idx %= array_length_1d(arr);
}

arr[idx].selected = true;

if keyboard_check_pressed(vk_enter)
{
		if arr[idx] = object_start
			{}
		else if arr[idx] = object_exit
			game_end();
}