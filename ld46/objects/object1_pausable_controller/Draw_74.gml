/// @description Insert description here
// You can write your code in this editor
if (paused)
{
	exit_to_menu_width = sprite_get_width(sprite_pause_exit_to_menu);
	exit_to_menu_height = sprite_get_height(sprite_pause_exit_to_menu);
	yes_width = sprite_get_width(sprite_pause_yes);
	start_x = camera_get_view_width(view_camera[0]) - exit_to_menu_width;
	start_y = camera_get_view_height(view_camera[0]) - 2 * exit_to_menu_height;
	
	draw_sprite_ext(sprite_pause_exit_to_menu, 0, start_x, start_y, 2, 2, 0, c_white, 1);
	if (option == option_yes && floor(2 * flash_count / max_flash_count) % max_flash_count == 0)
	{
		draw_sprite_ext(sprite_pause_yes, 1, start_x + 16, start_y + 3 * exit_to_menu_height, 2, 2, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(sprite_pause_yes, 0, start_x + 16, start_y + 3 * exit_to_menu_height, 2, 2, 0, c_white, 1);
	}
	
	if (option == option_no && floor(2 * flash_count / max_flash_count) % max_flash_count == 0)
	{
		draw_sprite_ext(sprite_pause_no, 1, start_x + 4 * yes_width, start_y + 3 * exit_to_menu_height, 2, 2, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(sprite_pause_no, 0, start_x + 4 * yes_width, start_y + 3 * exit_to_menu_height, 2, 2, 0, c_white, 1);
	}
	
	flash_count = (flash_count + 1) % max_flash_count;
}