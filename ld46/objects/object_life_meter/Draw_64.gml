/// @description Insert description here
// You can write your code in this editor

start_x = 40;

if (target == object_living_creature)
{
	start_x = 240;
}

if (target == object_spheroid || target == object_slab || target == object_driller)
{
	start_x = 440;
}


full_width = 100;
if (instance_exists(target))
	end_x = full_width * min(target.max_hit_count - target.hit_count, target.max_hit_count) / target.max_hit_count + start_x;
else
	end_x = start_x;

start_y = 10;
height = 24;


icon_height = height;
sprite = object_get_sprite(target);
draw_sprite_stretched(sprite, 0, start_x - 30, start_y, sprite_get_width(sprite) * icon_height / sprite_get_height(sprite), icon_height);


draw_roundrect_color(start_x - 5, start_y - 5, start_x + full_width + 5, start_y + height + 5, c_gray, c_gray, false);
draw_roundrect_color(start_x, start_y, start_x + full_width, start_y + height, c_white, c_white, true);
draw_roundrect_color(start_x, start_y, end_x, start_y + height, c_white, c_white, false);