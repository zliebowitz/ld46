/// @description Insert description here
// You can write your code in this editor

global.dead_zone_x = -100;
global.dead_zone_y = -100;

max_hit_count = 16;
hit_count = 0;
last_hit_count = 0;
max_flash_count = 60;
flash_count = max_flash_count;

x_acceleration = 0.1;
max_x_velocity = 4.0;
x_velocity = 0.0;
x_position = x;
max_dx = 32;