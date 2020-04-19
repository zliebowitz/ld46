previous_positions_x[previous_positions_first_index] = global.dead_zone_x;
previous_positions_y[previous_positions_first_index] = global.dead_zone_y;
previous_positions_first_index = (previous_positions_first_index + 1) % max_previous_positions;
num_previous_positions = max(num_previous_positions - 1, 0);