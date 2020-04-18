/// @description Insert description here
// You can write your code in this editor

if (hit_count < max_hit_count)
{
}
else if (hit_count == max_hit_count && sprite_index != sprite_living_creature_dying)
{
	sprite_index = sprite_living_creature_dying;
}

x_acceleration = 0;
if (keyboard_check(vk_left))
{
	x_acceleration = -.12;
}
else if (keyboard_check(vk_right))
{
	x_acceleration = .12
}
else
{
	// drag
	x_velocity *= .95
	if x_velocity <= .2
		x_velocity = 0;
}


if (place_free(x_position + x_velocity, y_position))
{
	x_position = x_position + x_velocity;
	x_velocity = min(x_velocity + x_acceleration, max_x_velocity);
}

x = floor(x_position);




if (jumps > 0  && place_free(x_position, y_position + y_velocity))
{
	if (y_velocity > 0)
	{
		jumps = 0;
	}
	else y_velocity = 0;
}

if (jumps < 2 && keyboard_key_press(vk_space))
{
	jumps++;
	y_velocity = initial_jump_velocity;
}

if (jumps > 0)
{
	y_velocity += y_acceleration;
	y_velocity = max(y_velocity, max_y_velocity);
}	


if (place_free(x_position, y_position + y_velocity))
{
	y_position = y_position + y_velocity;
	y_velocity = min(y_velocity + y_acceleration, max_y_velocity);
}

y = floor(y_position);