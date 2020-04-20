/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (sprite_index == sprite_living_creature_victory)
{
	if (jump_count == 4)
	{
		room_goto_next();
	}
	
	jump_count++;
}