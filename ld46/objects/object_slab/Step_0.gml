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
		object_living_creature.sprite_index = sprite_living_creature_victory;
		if (!victory_played)
		{
			audio_play_sound(sound_victory_fx, 10, false);
			victory_played = true;
		}
	}
	exit;
}

if (!instance_exists(object_shinobo))
{
	y = top;
	exit;
}

if (!horizontal)
{
	dx = 0;
	if (shake_count < max_shake_count)
	{
		if (shake_count % 4 == 0 || shake_count % 4 ==3)
			dx = 2;
		else
			dx = -2;
		shake_count++;
	}
	else if (shake_count = max_shake_count && dy = 0)
	{
		// just swapped from horizontal
		dy = 4;
	}
	else if (y + sprite_width / 2 - 32 > object_ground.y)
	{
		dy = -4;
	}
	else if (y <= top)
	{
		horizontal = true;
	}
	
}

if (horizontal)
{
	y = top;
	diff_x = object_shinobo.x - x;
	dist = min(abs(diff_x), max_horizontal_speed);
	dx = sign(diff_x) * dist;
	dy = 0;
	if (abs(x - object_shinobo.x) < 2)
	{
		shake_count = 0;
		horizontal = false;
	}
}

if (place_meeting(x, y, object_shinobo))
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

if (place_meeting(x, y, object_living_creature))
{
	if (object_living_creature.sprite_index != sprite_living_creature_dying && object_living_creature.flash_count == object_living_creature.max_flash_count)
	{
		object_living_creature.hit_count++;
	}
}

x += dx;
y += dy;
y = max(y, top);


if (place_meeting(x, y, object_shinobo))
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

if (place_meeting(x, y, object_living_creature))
{
	if (object_living_creature.sprite_index != sprite_living_creature_dying && object_living_creature.flash_count == object_living_creature.max_flash_count)
	{
		object_living_creature.hit_count++;
	}
}


