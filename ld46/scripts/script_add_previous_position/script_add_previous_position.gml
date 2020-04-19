/// @argument0 x
/// @argument1 y
/// @argument2 xscale

if (num_previous_positions == max_previous_positions)
{
	script_delete_last_previous_position();
}

index = (previous_positions_first_index + num_previous_positions) % max_previous_positions;
previous_positions_x[index] = argument0;
previous_positions_y[index] = argument1;
previous_positions_xscale[index] = argument2;
num_previous_positions = min(num_previous_positions + 1, max_previous_positions);