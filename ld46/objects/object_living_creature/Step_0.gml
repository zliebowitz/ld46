/// @description Insert description here
// You can write your code in this editor

if (hit_count < max_hit_count)
{
	dx = object_shinobo.x_position - x_position;
	
	if (abs(dx) > max_dx)
	{
		image_xscale = sign(dx);
		x_velocity = min(x_velocity + x_acceleration, max_x_velocity);
		
		if (place_free(x_position + image_xscale * x_velocity, y))
		{
			x_position = x_position + image_xscale * x_velocity;
		}
		
		sprite_index = sprite_living_creature_waddling;
	}
	else
	{
		x_velocity = 0;
		sprite_index = sprite_living_creature_idle;
	}
	
	x = floor(x_position);
}
else if (hit_count == max_hit_count && sprite_index != sprite_living_creature_dying)
{
	sprite_index = sprite_living_creature_dying;
}