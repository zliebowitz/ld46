/// @description Insert description here
// You can write your code in this editor

start_x = sprite_width * .2 + x
end_x = sprite_width * .8 * (target.max_hit_count - target.hit_count) / target.max_hit_count + x;

draw_rectangle_color(start_x, y, end_x, y + sprite_height, c_white, c_white, c_white, c_white, 0);