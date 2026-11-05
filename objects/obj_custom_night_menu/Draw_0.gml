if throwout {
	yv1+=0.8;
	x1+=xv1;
	y1+=yv1;
	yv2+=0.8;
	x2+=xv2;
	y2+=yv2;
	yv3+=0.8;
	x3+=xv3;
	y3+=yv3;
	alph = max(alph-0.07,0);
} else {
	x1 = random_range(-1,1);
	y1 = random_range(-1,1);
	x2 = random_range(-1,1);
	y2 = random_range(-1,1);
	x3 = random_range(-1,1);
	y3 = random_range(-1,1);
	alph = min(alph+0.07,1);
}

draw_set_alpha(alph);
var f1 = spr_fley_icon;
if savedata[2].female f1 = spr_fem_icon;
draw_sprite(f1,1,200, 180);
draw_sprite(spr_ette_icon,1,400, 180);
draw_sprite(spr_turbo_icon,1,600, 180);
f1 = spr_statue_icon;
if savedata[2].peanut f1 = spr_peanut_icon;
draw_sprite(f1,1,800, 180);
draw_sprite(spr_stick_icon,1,1000, 180);
draw_sprite(spr_paint_icon,1,1200, 180);
draw_sprite(spr_astley_icon,1,1400, 180);
draw_sprite(spr_plush_icon,1,200, 380);
draw_sprite(spr_clown_icon,1,400, 380);
f1 = spr_yandare_icon;
if savedata[2].monika f1 = spr_monika_icon;
draw_sprite(f1,1,600, 380);
draw_sprite(spr_edgy_icon,1,800, 380);
draw_set_alpha(1);

for (var p = 0; p < 11; p++) {
	var _x = 200;
	var _y = 180;
	_x += p*200;
	if _x > 1400 {
		_x -= 1400;
		_y += 200;
	}
	if mouse_x < _x + 84 && mouse_x > _x - 84 && mouse_y < _y + 85 && mouse_y > _y - 85 && !(throwout){
		gpu_set_fog(1, c_black, 0, 99);
		draw_sprite_ext(spr_fem_icon, 1, _x, _y, 1, 1, 0, c_white, 0.25);
		gpu_set_fog(0, c_white, 0, 99);
		draw_set_color(c_white);
		draw_sprite_ext(spr_custom_night_plus, 1, _x, _y, 1, 1, 0, c_white, 0.8);
		if mouse_x < _x + 72 && mouse_x > _x - 72 && mouse_y < _y + 18 && mouse_y > _y - 18 && !(throwout){
			gpu_set_fog(1, c_white, 0, 99);
			draw_sprite_ext(spr_custom_night_plus, 1, _x, _y, 1, 1, 0, c_white, 0.2);
			gpu_set_fog(0, c_white, 0, 99);
			if mouse_check_button_pressed(mb_left) {
				audio_play_sound(sfx_select,5,false);
				customnightais[p]++;
				if customnightais[p] > 25 customnightais[p] = 0;
			}
		}
		draw_sprite_ext(spr_custom_night_minus, 1, _x, _y+50, 1, 1, 0, c_white, 0.8);
		if mouse_x < _x + 72 && mouse_x > _x - 72 && mouse_y < _y + 50 + 18 && mouse_y > _y + 50 - 18 && !(throwout){
			gpu_set_fog(1, c_white, 0, 99);
			draw_sprite_ext(spr_custom_night_minus, 1, _x, _y + 50, 1, 1, 0, c_white, 0.2);
			gpu_set_fog(0, c_white, 0, 99);
			if mouse_check_button_pressed(mb_left) {
				audio_play_sound(sfx_select,5,false);
				customnightais[p]--;
				if customnightais[p] < 0 customnightais[p] = 25;
			}
		}
	}
	draw_text(_x-70,_y-80,customnightais[p]);
}

if setalltonum {
	draw_set_font(fnt_clock);
	draw_set_color(c_red)
	//Add setnum script here
	var str = setallval;
	var _y = room_height/2+100+y2;
	var _x = x-string_width(str)/2+x2;
	draw_text(_x,_y, str);
	if mouse_x < _x + string_width(str) + string_width("+") + 5 && mouse_x > _x + string_width(str) - 10 && mouse_y < _y + string_height("+") -15 && mouse_y > _y - 5  && !(throwout) {
		draw_set_color(c_white);
		if mouse_check_button_pressed(mb_left) { 
			audio_play_sound(sfx_select,10,false);
			setallval++;
			if setallval > 25 setallval = 0;
		}
	}
	draw_text(_x+string_width(str),_y, "+");
	draw_set_color(c_red)
	if mouse_x < _x - 50 + string_width("+") + 5 && mouse_x > _x - 50 - 10 && mouse_y < _y + string_height("+") -15 && mouse_y > _y - 5  && !(throwout) {
		draw_set_color(c_white);
		if mouse_check_button_pressed(mb_left) { 
			audio_play_sound(sfx_select,10,false);
			setallval--;
			if setallval < 0 setallval = 25;
		}
	}
	draw_text(_x-50,_y, "-");
	
	draw_set_color(c_red)
	var str = "Set";
	var _y = room_height/2+200+y3;
	var _x = x-string_width(str)/2+x3;
	if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
		draw_set_color(c_white);
		if mouse_check_button_pressed(mb_left) { 
			audio_play_sound(sfx_select,10,false);
			for (var p = 0; p < 11; p++) {
				customnightais[p] = setallval;
			}
			setalltonum = false;
		}
	}
	draw_text(_x,_y, str);
	
	draw_set_color(c_red)
	var str = "Cancel";
	var _y = room_height/2+300+y1;
	var _x = x-string_width(str)/2+x1;
	if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
		draw_set_color(c_white);
		if mouse_check_button_pressed(mb_left) { 
			audio_play_sound(sfx_select,10,false);
			setalltonum = false;
		}
	}
	draw_text(_x,_y, str);
	draw_set_color(c_white);
} else {
draw_set_font(fnt_clock);
draw_set_color(c_red)
var str = "Back";
var _y = room_height/2+300+y1;
var _x = x-string_width(str)/2+x1;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		instance_create_layer(x,y,"Buttons", obj_menu_night_select);
		throwout = true;
		xv1 = random_range(-15,15);
		yv1 = random_range(-10,-20);
		xv2 = random_range(-15,15);
		yv2 = random_range(-10,-20);
		xv3 = random_range(-15,15);
		yv3 = random_range(-10,-20);
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

draw_set_color(c_red)
var str = "Start";
var _y = room_height/2+200+y2;
var _x = x-string_width(str)/2+x2;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		var fadeout = instance_create_layer(x,y,"Fadeout", obj_fadeout);
		fadeout.roomset = rm_nightdisplay;
		night = 6;
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

draw_set_color(c_red)
var str = "Set All To Number";
var _y = room_height/2+100+y3;
var _x = x-string_width(str)/2+x3;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		setalltonum = true;
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

if y3 > 500 instance_destroy(self);
}
