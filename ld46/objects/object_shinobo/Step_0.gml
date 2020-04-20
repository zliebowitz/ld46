/// @description Insert description here
// You can write your code in this editor

if (hit_count < max_hit_count)
{
	// handle dashing
	if (keyboard_check(vk_space) && dash_count < max_dash_count)
	{
		script_add_previous_position(x_position, y_position, image_xscale);
		
		x_velocity = min(x_velocity + 4 * x_acceleration, 4 * max_x_velocity);
		
		if (place_free(x_position + image_xscale * x_velocity, y_position))
		{
			x_position = x_position + image_xscale * x_velocity;
		}

		sprite_index = sprite_shinobo_dashing;
		dash_count = min(dash_count + 1, max_dash_count);
	}
	else
	{
		if (!keyboard_check(vk_space))
		{
			dash_count = 0;
		}
		script_delete_last_previous_position();
	}
	
	// handle moving left and right
	dx = 0;
	if (keyboard_check(vk_left))
	{
		dx = -1;
	}
	else if (keyboard_check(vk_right))
	{
		dx = 1;
	}
	
	if (abs(dx) > 0 && !(keyboard_check(vk_space) && dash_count < max_dash_count))
	{
		if (image_xscale != dx)
		{
			x_velocity = 0;
		}
		
		image_xscale = dx;
		x_velocity = min(x_velocity + x_acceleration, max_x_velocity);
		
		if (place_free(x_position + dx * x_velocity, y))
		{
			x_position = x_position + dx * x_velocity;
		}
		sprite_index = sprite_shinobo_walking;
	}
	else if (!(keyboard_check(vk_space) && dash_count < max_dash_count))
	{
		x_velocity = 0;
		sprite_index = sprite_shinobo_idle;
	}

	x = floor(x_position);
	
	// handle jumping
	if (keyboard_check(ord("Z")) && !jump_pressed)
	{
		if (!airborne)
		{
			y_velocity = jump_velocity;
			airborne = true;
			audio_play_sound(sound_jumping_fx, 10, false);
		}
		else if (!double_jumped)
		{
			y_velocity = jump_velocity;
			double_jumped = true;
			audio_play_sound(sound_jumping_fx, 10, false);
		}
		
		jump_pressed = true;
	}
	else if (!keyboard_check(ord("Z")))
	{
		if (y_velocity < 0)
		{
			y_velocity = 0;
		}
		
		jump_pressed = false;
	}
	
	y_velocity = min(y_velocity + y_acceleration, max_y_velocity);
	
	if (place_free(x_position, y_position + y_velocity))
	{
		y_position = y_position + y_velocity;
	}
	else
	{
		if (y_velocity > 0)
		{
			while (!place_free(x_position, y_position + y_velocity))
			{
				y_velocity = y_velocity - y_acceleration;
			}
			
			y_position = y_position + y_velocity;
		}
		
		y_velocity = 0;
		if (airborne)
		{
			audio_play_sound(sound_landing_fx, 10, false);
		}
		airborne = false;
		double_jumped = false;
	}
	
	if (airborne)
	{
		if (y_velocity < 0)
		{
			sprite_index = sprite_shinobo_jumping;
		}
		else
		{
			sprite_index = sprite_shinobo_falling;
		}
	}
	
	y = floor(y_position);
	
	// handle attacking
	if (keyboard_check(ord("X")) && !attack_pressed)
	{
		attack_pressed = true;
		attack_count = 0;
	}
	else if (!keyboard_check(ord("X")))
	{
		attack_pressed = false;
	}
	
	if (attack_count < max_attack_count)
	{
		sprite_index = sprite_shinobo_attacking;
		image_index = attack_count * sprite_get_number(sprite_shinobo_attacking) / max_attack_count;
		attack_count = min(attack_count + 1, max_attack_count);
	}
}
else if (hit_count == max_hit_count)
{
	if (object_music_player.sound != sound_death_music)
	{
		audio_stop_sound(object_music_player.sound);
	}
}