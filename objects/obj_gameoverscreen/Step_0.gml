if game_over {
	if image_alpha = 0 {
		audio_stop_all();
		audio_play_sound(sfx_glass_smash, 100, 0);
		image_alpha = 1;
		shake = 45;
	}
	image_alpha = max(0.6, image_alpha-0.08);
}
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);
