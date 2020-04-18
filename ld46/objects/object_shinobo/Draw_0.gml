/// @description Insert description here
// You can write your code in this editor

if (hit_count > last_hit_count && hit_count != max_hit_count)
{
	flash_count = 0;
}

if (flash_count < max_flash_count)
{
	if (floor(flash_count / 2) % 2 == 1)
	{
		draw_self();
	}
	
	flash_count++;
}
else
{
	draw_self();
}