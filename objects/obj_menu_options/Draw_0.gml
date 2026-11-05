if clearsave {
	draw_set_font(fnt_clock);
	draw_set_color(c_red);
	draw_text(room_width/2 - string_width("Are you sure?")/2,room_height/2-100, "Are you sure?");
	x1 = random_range(-1,1);
	y1 = random_range(-1,1);
	x2 = random_range(-3,3);
	y2 = random_range(-3,3);
	
	var str = "Yes (This will restart the game)";
	var _y = room_height/2+100+y2;
	var _x = x-string_width(str)/2+x2;
	if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
		draw_set_color(c_white);
		x2+=random_range(-4,4);
		y2+=random_range(-4,4);
		if mouse_check_button_pressed(mb_left) { 
			file_delete("savedata.dat");
			audio_stop_sound(mus_vanessas_curse_lobby);
			room_goto(rm_loadgraphics);
		}
	}
	draw_text(_x,_y, str);
	draw_set_color(c_red);
	
	var str = "No";
	var _y = room_height/2+200+y1;
	var _x = x-string_width(str)/2+x1;
	if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
		draw_set_color(c_white);
		if mouse_check_button_pressed(mb_left) { 
			clearsave = false;
		}
	}
	draw_text(_x,_y, str);
	draw_set_color(c_white);
} else {
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
	yv4+=0.8;
	x4+=xv4;
	y4+=yv4;
	yv5+=0.8;
	x5+=xv5;
	y5+=yv5;
} else {
	x1 = random_range(-1,1);
	y1 = random_range(-1,1);
	x2 = 0;
	y2 = 0;
	x3 = 0;
	y3 = 0;
	x4 = 0;
	y4 = 0;
	x5 = 0;
	y5 = 0;
}

draw_set_font(fnt_power);
draw_text(150+x5,50+y5, "Skins");
var f1 = spr_fley_icon;
var f2 = spr_statue_icon;
var f3 = spr_yandare_icon;
if savedata[2].female f1 = spr_fem_icon;
if savedata[2].peanut f2 = spr_peanut_icon;
if savedata[2].monika f3 = spr_monika_icon;
draw_sprite(f1,1,200+x2, 180+y2);
draw_sprite(f2,1,400+x3, 180+y3);
draw_sprite(f3,1,600+x4, 180+y4);
var _x = 200;
var _y = 180;
if mouse_x < _x + 84 && mouse_x > _x - 84 && mouse_y < _y + 85 && mouse_y > _y - 85 && !(throwout){
	gpu_set_fog(1, c_white, 0, 99);
	draw_sprite_ext(f1, 1, _x, _y, 1, 1, 0, c_white, 0.25);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select,10,false);
		savedata[2].female = !(savedata[2].female);
		scr_savedata();
	}
}
gpu_set_fog(0, c_white, 0, 99);
var _x = 400;
if mouse_x < _x + 84 && mouse_x > _x - 84 && mouse_y < _y + 85 && mouse_y > _y - 85 && !(throwout){
	gpu_set_fog(1, c_white, 0, 99);
	draw_sprite_ext(f2, 1, _x, _y, 1, 1, 0, c_white, 0.25);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select,10,false);
		savedata[2].peanut = !(savedata[2].peanut);
		scr_savedata();
	}
}
gpu_set_fog(0, c_white, 0, 99);
var _x = 600;
if mouse_x < _x + 84 && mouse_x > _x - 84 && mouse_y < _y + 85 && mouse_y > _y - 85 && !(throwout){
	gpu_set_fog(1, c_white, 0, 99);
	draw_sprite_ext(f3, 1, _x, _y, 1, 1, 0, c_white, 0.25);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select,10,false);
		savedata[2].monika = !(savedata[2].monika);
		scr_savedata();
	}
}
gpu_set_fog(0, c_white, 0, 99);

draw_set_font(fnt_clock);
draw_set_color(c_red);
_x = 150+x5;
_y = 270+y5;
str = "Music Volume";
if mouse_x < _x + 780 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select,10,false);
		switch savedata[1].music {
			case 100: savedata[1].music = 90; break;
			case 90: savedata[1].music = 80; break;
			case 80: savedata[1].music = 70; break;
			case 70: savedata[1].music = 60; break;
			case 60: savedata[1].music = 50; break;
			case 50: savedata[1].music = 40; break;
			case 40: savedata[1].music = 30; break;
			case 30: savedata[1].music = 20; break;
			case 20: savedata[1].music = 10; break;
			case 10: savedata[1].music = 0; break;
			case 0: savedata[1].music = 100; break;
		}
		scr_savedata();
		instance_create_layer(x,y,layer,obj_audio_manager);
	}
}
draw_text(_x,_y, str);
draw_text(_x+650,_y, savedata[1].music);
draw_set_color(c_red);
_x = 150+x5;
_y = 370+y5;
str = "Sound Volume";
if mouse_x < _x + 780 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select,10,false);
		switch savedata[1].sound {
			case 100: savedata[1].sound = 90; break;
			case 90: savedata[1].sound = 80; break;
			case 80: savedata[1].sound = 70; break;
			case 70: savedata[1].sound = 60; break;
			case 60: savedata[1].sound = 50; break;
			case 50: savedata[1].sound = 40; break;
			case 40: savedata[1].sound = 30; break;
			case 30: savedata[1].sound = 20; break;
			case 20: savedata[1].sound = 10; break;
			case 10: savedata[1].sound = 0; break;
			case 0: savedata[1].sound = 100; break;
		}
		scr_savedata();
		instance_create_layer(x,y,layer,obj_audio_manager);
	}
}
draw_text(_x,_y, "Sound Volume");
draw_text(_x+650,_y, savedata[1].sound);
draw_set_color(c_red);
_y = 470+y5;
str = "Erase Save Data";
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(sfx_select,10,false);
		clearsave = true;
	}
}
draw_text(_x,_y, str);

draw_set_font(fnt_clock);
draw_set_color(c_red)
var str = "Back";
var _y = room_height/2+300+y1;
var _x = x-string_width(str)/2+x1;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		instance_create_layer(x,y,"Buttons", obj_menu_main);
		throwout = true;
		xv1 = random_range(-15,15);
		yv1 = random_range(-10,-20);
		xv2 = random_range(-15,15);
		yv2 = random_range(-10,-20);
		xv3 = random_range(-15,15);
		yv3 = random_range(-10,-20);
		xv4 = random_range(-15,15);
		yv4 = random_range(-10,-20);
		xv5 = random_range(-15,15);
		yv5 = random_range(-10,-20);
		obj_menu.alphastate = false;
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

if y1 > 1500 instance_destroy(self);
}
