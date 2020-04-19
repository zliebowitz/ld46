/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_escape)
{
	paused = !paused;
	
	if (paused)
	{
		option = option_no;
		
		// deactivate all objects (except this one):
		instance_deactivate_all(true);
		
		// disable drawing of the application surface because we will draw our copy now
		application_surface_draw_enable(false);
		audio_pause_all();
	}
	else
	{
		instance_activate_all();
		application_surface_draw_enable(true);
		audio_resume_all();
	}
}

if ((keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) && paused)
{
	audio_play_sound(sound_title_select_fx, 10, false);
	option = (option + 1) % num_options;
}

if (keyboard_check_pressed(vk_enter) && paused)
{
	instance_activate_all();
	application_surface_draw_enable(true);
	audio_resume_all();
		
	if (option == option_yes)
	{
		room_goto(room_title);
	}
	else
	{
		paused = false;
	}
}