/// @description Insert description here
// You can write your code in this editor
event_inherited();

x_acceleration = 0.2;
max_x_velocity = 4.0;
x_velocity = 0.0;
x_position = x;

attack_pressed = false;
max_attack_count = 10;
attack_count = max_attack_count;

y_acceleration = 0.4;
jump_velocity = -10.0;
max_y_velocity = 10.0;
y_velocity = 0;
y_position = y;
airborne = false;
double_jumped = false;
jump_pressed = false;

max_previous_positions = 16;
previous_positions_first_index = 0;
num_previous_positions = 0;
for (i = max_previous_positions - 1; i > -1; i--)
{
	previous_positions_x[i] = global.dead_zone_x;
	previous_positions_y[i] = global.dead_zone_y;
	previous_positions_xscale[i] = image_xscale;
}