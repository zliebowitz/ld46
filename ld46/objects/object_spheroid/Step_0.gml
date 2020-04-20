/// @description Insert description here
// You can write your code in this editor

if (countdown_count < max_countdown_count)
{
	countdown_count++;
	return;
}

if (sprite_index == death_sprite)
{
	if object_living_creature.sprite_index != sprite_living_creature_dying
	{
		object_living_creature.sprite_index = sprite_living_creature_victory
		if (!victory_played)
		{
			audio_play_sound(sound_victory_fx, 10, false);
			victory_played = true;
		}
	}
	exit;
}

position_x = x;
position_y = y;

if (!floating)
{
	// dtry not to shoot too far past the dest, but definitly reverse when you do
	//if (sqr(position_x - dest_x) + sqr(position_y - dest_y) < .999 ||
	//sign(dest_x - position_x) != sign(dx) ||
	//sign(dest_y - position_y) != sign(dy))
	if (position_y + sprite_width / 2 > dest_y)
	{
		angle = random_range(3/2 * pi, 2 * pi - 0.2);
		pace = random_range(min_float_speed, max_float_speed);
		if (was_hit)
		{
			pace = 1.5 * pace;
		}
		dx = pace * sign(object_living_creature.x - position_x) * cos(angle)
		dy = pace * sin(angle);
		if (dy > 0)
		{
			show_debug_message("angle: " + string(angle));
			show_debug_message("dy should not be positive");
		}
		floating = true;
		wait_time = random_range(min_wait_time, max_wait_time);
	}
}
else
{
	wait_time--;
	if (wait_time <= 0)
	{
		floating = false;
		dest_x = object_living_creature.x;
		dest_y = object_ground.y;
	}
}

if (!floating)
{
		dx = dest_x - position_x;
		dy = dest_y - position_y;
		len = dx * dx + dy * dy;
		if (len < 0.5) // to prevent sqrt from crashing (yes, it can happen apparently)
		{
			len = 0.5;
		}
		len = sqrt(len);
		dx *= attack_speed / len;
		dy *= attack_speed / len;
		
		if (dy < 0)
		{
			show_debug_message("dy should not be negative");
		}
}



if (place_meeting(position_x, position_y, object_shinobo))
{
	if (object_shinobo.sprite_index == sprite_shinobo_attacking)
	{
		if flash_count == max_flash_count
			hit_count++;
	}
	else if (object_shinobo.sprite_index != sprite_shinobo_dying && object_shinobo.flash_count == object_shinobo.max_flash_count)
	{
		object_shinobo.hit_count++;
	}
}

if (place_meeting(position_x, position_y, object_living_creature))
{
	if (object_living_creature.sprite_index != sprite_living_creature_dying && object_living_creature.flash_count == object_living_creature.max_flash_count)
	{
		object_living_creature.hit_count++;
	}
}

position_x += dx;
position_y += dy;

if (place_meeting(position_x, position_y, object_shinobo))
{
	if (object_shinobo.sprite_index == sprite_shinobo_attacking)
	{
		if flash_count == max_flash_count
			hit_count++;
	}
	else if (object_shinobo.sprite_index != sprite_shinobo_dying && object_shinobo.flash_count == object_shinobo.max_flash_count)
	{
		object_shinobo.hit_count++;
	}
}

if (place_meeting(position_x, position_y, object_living_creature))
{
	if (object_living_creature.sprite_index != sprite_living_creature_dying && object_living_creature.flash_count == object_living_creature.max_flash_count)
	{
		object_living_creature.hit_count++;
	}
}


x = floor(position_x);
y = floor(position_y);

if (hit_count > last_hit_count)
{
	dest_x = x;
	dest_y = y - 10;
	was_hit = true;
	floating = false;
}
else
{
	was_hit = false;
}