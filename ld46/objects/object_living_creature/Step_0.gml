/// @description Insert description here
// You can write your code in this editor

if (hit_count < max_hit_count)
{
}
else if (hit_count == max_hit_count && sprite_index != sprite_living_creature_dying)
{
	sprite_index = sprite_living_creature_dying;
}

if (place_free(x_position + x_velocity, y))
{
	x_position = x_position + x_velocity;
	x_velocity = min(x_velocity + x_acceleration, max_x_velocity);
}

x = floor(x_position);