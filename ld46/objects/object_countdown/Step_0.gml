/// @description Insert description here
// You can write your code in this editor

if (countdown_count < max_countdown_count)
{
	if (countdown_count > 3 * room_speed)
	{
		sprite_index = sprite_countdown_go;
	}
	else if (countdown_count > 2 * room_speed)
	{
		sprite_index = sprite_countdown_1;
	}
	else if (countdown_count > 1 * room_speed)
	{
		sprite_index = sprite_countdown_2;
	}
	else
	{
		sprite_index = sprite_countdown_3;
	}

	countdown_count++;
}