/// @description Insert description here
// You can write your code in this editor

if (countdown_count < max_countdown_count)
{
	countdown_count++;
	return;
}

if (!instance_exists(object_shinobo))
	exit;
	
if (sprite_index == sprite_living_creature_victory)
{
	audio_stop_sound(sound_boss_music);
	exit;
}

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
else if (hit_count == max_hit_count)
{
	if (!death_music_played && object_shinobo.sprite_index != sprite_shinobo_dying)
	{
		audio_stop_sound(object_music_player.sound);
		audio_play_sound(sound_death_music, 10, false);
		death_music_played = true;
		alarm[0] = 10 * room_speed;
	}
}