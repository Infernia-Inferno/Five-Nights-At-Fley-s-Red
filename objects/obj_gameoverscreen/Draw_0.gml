draw_self();
draw_set_font(fnt_gameover);
var s = "Game Over";
if game_over {
	delay--;
	draw_set_color(c_red);
	draw_text(x+720-string_width(s)/2+shake*random_range(-1,1),y+405-80+shake*random_range(-1,1), s);
	shake = max(shake-1,0);
	
	if delay < 0 {
		alph = min(alph+0.1, 1);
		var s = "Retry";
		draw_set_alpha(alph);
		draw_set_font(fnt_clock);
		var _x = x+720;
		var _y = y+460;
		if mouse_x < _x + string_width(s)/2 && mouse_x > _x - string_width(s)/2 && mouse_y < _y + string_height(s) && mouse_y > _y {
			draw_set_color(c_white);
			if mouse_check_button_pressed(mb_left) {
				audio_play_sound(sfx_select, 100, 0);
				instance_create_layer(0,0,"Fadeout",obj_fadeout);
			}
		}
		draw_text(x+720-string_width(s)/2+shake*random_range(-1,1),_y, s);
		draw_set_alpha(1);
		
		var s = "Menu";
		draw_set_alpha(alph);
		draw_set_color(c_red);
		var _x = x+720;
		var _y = y+560;
		if mouse_x < _x + string_width(s)/2 && mouse_x > _x - string_width(s)/2 && mouse_y < _y + string_height(s) && mouse_y > _y {
			draw_set_color(c_white);
			if mouse_check_button_pressed(mb_left) {
				audio_play_sound(sfx_select, 100, 0);
				var fadeout = instance_create_layer(0,0,"Fadeout",obj_fadeout);
				fadeout.roomset = rm_menu;
			}
		}
		draw_text(x+720-string_width(s)/2+shake*random_range(-1,1),_y, s);
		draw_set_alpha(1);
	}
	
	draw_set_color(c_white);
}
