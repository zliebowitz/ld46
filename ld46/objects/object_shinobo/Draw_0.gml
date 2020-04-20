/// @description Insert description here
// You can write your code in this editor
event_inherited();

for (i = 0; i < num_previous_positions; i++)
{
	index = (previous_positions_first_index + i) % max_previous_positions;
	draw_sprite_ext(sprite_shinobo_dashing, 0, previous_positions_x[index], previous_positions_y[index], previous_positions_xscale[index], 1, 0, c_white, 0.333);
}