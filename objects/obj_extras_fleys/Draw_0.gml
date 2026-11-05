if throwout {
	yv1+=0.8;
	x1+=xv1;
	y1+=yv1;
	alph = max(alph-0.07,0);
} else {
	x1 = random_range(-1,1);
	y1 = random_range(-1,1);
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
		gpu_set_fog(1, c_white, 0, 99);
		draw_sprite_ext(spr_fem_icon, 1, _x, _y, 1, 1, 0, c_white, 0.25);
		if mouse_check_button_pressed(mb_left) {
			audio_play_sound(sfx_select,5,false);
			var a = instance_create_layer(x,y,"Buttons", obj_extra_fleydisplay);
			throwout = true;
			xv1 = random_range(-15,15);
			yv1 = random_range(-10,-20);
			a.myfley = p;
		}
		gpu_set_fog(0, c_white, 0, 99);
	}
}

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
		obj_menu.alphastate = true;
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

if y1 > 500 instance_destroy(self);
