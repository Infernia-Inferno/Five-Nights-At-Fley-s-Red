if !(game_over) lifetime++;
if game_over image_speed = 0;
if lifetime = 20 {
	game_over = true;
}
if lifetime = 34 instance_destroy(self);
