draw_self();
draw_set_font(fnt_gameover);
var s = "Paused";
sinthing+=0.1;
draw_text(x+720-string_width(s)/2,y+405-80+sin(sinthing)*10, s);

draw_set_color(c_red);
var s = "Resume";
draw_set_font(fnt_clock);
var _x = x+720;
var _y = y+460;
if mouse_x < _x + string_width(s)/2 && mouse_x > _x - string_width(s)/2 && mouse_y < _y + string_height(s) && mouse_y > _y {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select, 100, 0);
		audio_resume_sound(mus_a_hat_in_time_vanessa_wants_to_play);
		instance_destroy(self);
	}
}
draw_text(x+720-string_width(s)/2+shake*random_range(-1,1),_y+shake*random_range(-1,1), s);

draw_set_color(c_red);
var s = "Restart Night";
draw_set_font(fnt_clock);
var _x = x+720;
var _y = y+560;
if mouse_x < _x + string_width(s)/2 && mouse_x > _x - string_width(s)/2 && mouse_y < _y + string_height(s) && mouse_y > _y {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select, 100, 0);
		instance_create_layer(0,0,"Fadeout",obj_fadeout);
	}
}
draw_text(x+720-string_width(s)/2+shake*random_range(-1,1),_y+shake*random_range(-1,1), s);
		
var s = "Menu";
draw_set_color(c_red);
var _x = x+720;
var _y = y+660;
if mouse_x < _x + string_width(s)/2 && mouse_x > _x - string_width(s)/2 && mouse_y < _y + string_height(s) && mouse_y > _y {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select, 100, 0);
		var fadeout = instance_create_layer(0,0,"Fadeout",obj_fadeout);
		fadeout.roomset = rm_menu;
	}
}
draw_text(x+720-string_width(s)/2+shake*random_range(-1,1),_y+shake*random_range(-1,1), s);
draw_set_alpha(1);
draw_set_color(c_white);
