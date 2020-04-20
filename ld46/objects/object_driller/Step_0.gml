/// @description Insert description here
// You can write your code in this editor


/// @description Insert description here
// You can write your code in this editor

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

if (go_to_center)
{
	diff_x = center - x;
	dx = sign(diff_x) * min(normal_speed, abs(diff_x));
	if (abs(diff_x) < 2)
	{
		go_to_center = false;
		shake_count = 0;
	}
}

if (!go_to_center)
{
	if (shake_count < max_shake_count)
	{
		if (shake_count % 4 == 0 || shake_count % 4 ==3)
			dx = 2;
		else
			dx = -2;
		shake_count++;
		dir = sign(object_shinobo.x - x);
	}
	if (shake_count == max_shake_count)
	{
		// just swapped from horizontal
		dx = normal_speed * dir;
	}
	if (x + dx < 0 || x + dx > room_width)
	{
		go_to_center = true;
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


