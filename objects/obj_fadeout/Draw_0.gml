image_alpha = min(1,image_alpha + 0.06);
draw_set_color(c_black);
draw_set_alpha(image_alpha);
draw_rectangle(0,0,room_width,room_height, false);
draw_set_color(c_white);
draw_set_alpha(1);
if image_alpha = 1 {
	audio_stop_sound(mus_vanessas_curse_lobby);
	room_goto(roomset);
}
