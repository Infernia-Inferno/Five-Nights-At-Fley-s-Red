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


var s = spr_desc_fley;
switch myfley {
	case 1: s = spr_desc_ette; break;
	case 2: s = spr_desc_turbo; break;
	case 3: s = spr_desc_statue; break;
	case 4: s = spr_desc_stick; break;
	case 5: s = spr_desc_paint; break;
	case 6: s = spr_desc_astley; break;
	case 7: s = spr_desc_plush; break;
	case 8: s = spr_desc_clown; break;
	case 9: s = spr_desc_yand; break;
	case 10: s = spr_desc_edgy; break;
}
draw_sprite_ext(s,0,x,y,1,1,0, c_white,alph);

draw_set_font(fnt_clock);
draw_set_color(c_red)
var str = "Back";
var _y = room_height/2+300+y1;
var _x = x-string_width(str)/2+x1;
if mouse_x < _x + string_width(str) + 5 && mouse_x > _x - 10 && mouse_y < _y + string_height(str) -15 && mouse_y > _y - 5  && !(throwout) {
	draw_set_color(c_white);
	if mouse_check_button_pressed(mb_left) { 
		audio_play_sound(sfx_select,10,false);
		instance_create_layer(x,y,"Buttons", obj_extras_fleys);
		throwout = true;
		xv1 = random_range(-15,15);
		yv1 = random_range(-10,-20);
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

if y1 > 500 instance_destroy(self);
