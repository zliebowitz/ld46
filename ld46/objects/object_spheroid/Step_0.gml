/// @description Insert description here
// You can write your code in this editor
if (sprite_index == death_sprite)
	exit;

position_x = x;
position_y = y;

if (!floating)
{
	// dtry not to shoot too far past the dest, but definitly reverse when you do
	if (sqr(position_x - dest_x) + sqr(position_y - dest_y) < .999 || sign(dest_x - position_x) != sign(dx))
	{
		angle = random_range(3/2 * pi, 2 * pi - 02);
		pace = random_range(min_float_speed, max_float_speed);
		dx = pace * sign(object_shinobo.x - position_x) * cos(angle)
		dy = pace * sin(angle);
		floating = true;
		wait_time = random_range(min_wait_time, max_wait_time);
	}
	else
	{
		// contiue dx/dy
	}
}
else
{
	wait_time--;
	if (wait_time <= 0)
	{
		floating = false;
		dest_x = object_shinobo.x;
		dest_y = object_shinobo.y;
		dx = dest_x - position_x;
		dy = dest_y - position_y;
		len = sqrt(dx * dx + dy * dy);
		dx *= attack_speed / len;
		dy *= attack_speed /len;
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
	dest_y = y;
}