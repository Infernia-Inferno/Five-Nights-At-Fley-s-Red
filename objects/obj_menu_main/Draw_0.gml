if throwout {
	yv1+=0.8;
	yv2+=0.8;
	yv3+=0.8;
	
	x1+=xv1;
	x2+=xv2;
	x3+=xv3;
	y1+=yv1;
	y2+=yv2;
	y3+=yv3;
} else {
	x1 = random_range(-1,1);
	y1 = random_range(-1,1);
	x2 = random_range(-1,1);
	y2 = random_range(-1,1);
	x3 = random_range(-1,1);
	y3 = random_range(-1,1);
}
function throwoutphysic() {
	throwout = true;
	xv1 = random_range(-15,15);
	yv1 = random_range(-10,-20);
	xv2 = random_range(-15,15);
	yv2 = random_range(-10,-20);
	xv3 = random_range(-15,15);
	yv3 = random_range(-10,-20);
}
draw_set_font(fnt_clock);
draw_set_color(c_red)
var str = "Play";
var _y = room_height/2+50+y1;
var _x = x-string_width(str)/2+x1;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		instance_create_layer(x,y,"Buttons", obj_menu_night_select);
		throwoutphysic();
	}
}
draw_text(_x,_y, str);
draw_set_color(c_red)
str = "Options";
_y = room_height/2+120+y2;
_x = x-string_width(str)/2+x2;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		instance_create_layer(x,y,"Buttons", obj_menu_options);
		obj_menu.alphastate = true;
		throwoutphysic();
	}
}
draw_text(_x,_y, str);
draw_set_color(c_red)
str = "Extras";
_y = room_height/2+190+y3;
_x = x-string_width(str)/2+x3;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		instance_create_layer(x,y,"Buttons", obj_extras_fleys);
		throwoutphysic();
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

if y1 > 500 instance_destroy(self);
