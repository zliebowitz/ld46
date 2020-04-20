/// @description Insert description here
// You can write your code in this editor
if (flash_count < max_flash_count)
{
	if (floor(flash_count / 8) % 2 == 0)
	{
		draw_self();
	}
	
	flash_count++;
}