/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, object_shinobo))
{
	if (object_shinobo.sprite_index == sprite_shinobo_attacking)
	{
		hit_count++;
	}
	else if (object_shinobo.sprite_index != sprite_shinobo_dying)
	{
		object_shinobo.hit_count++;
	}
}

if (place_meeting(x, y, object_living_creature))
{
	if (object_living_creature.sprite_index != sprite_living_creature_dying)
	{
		object_living_creature.hit_count++;
	}
}