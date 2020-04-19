/// @description Insert description here
// You can write your code in this editor

start_x = sprite_width * .2 + x;
full_width = sprite_width * .6;
end_x = full_width * (target.max_hit_count - target.hit_count) / target.max_hit_count + start_x;

draw_rectangle_color(start_x, y, start_x + full_width, y + sprite_height, c_gray, c_gray, c_gray, c_gray, true);
draw_rectangle_color(start_x, y, end_x, y + sprite_height, c_white, c_white, c_white, c_white, false);