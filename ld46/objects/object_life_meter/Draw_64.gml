/// @description Insert description here
// You can write your code in this editor

start_x = 10;

if (target == object_living_creature)
{
	start_x = 200;
}

if (target == object_spheroid)
{
	start_x = 400;
}


full_width = 100;
end_x = full_width * (target.max_hit_count - target.hit_count) / target.max_hit_count + start_x;

start_y = 10;
height = 24;

draw_roundrect_color(start_x - 5, start_y - 5, start_x + full_width + 5, start_y + height + 5, c_gray, c_gray, false);
draw_roundrect_color(start_x, start_y, start_x + full_width, start_y + height, c_white, c_white, true);
draw_roundrect_color(start_x, start_y, end_x, start_y + height, c_white, c_white, false);