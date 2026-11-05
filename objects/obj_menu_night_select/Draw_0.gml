if throwout {
	yv1+=0.8;
	x1+=xv1;
	y1+=yv1;
} else {
	x1 = random_range(-1,1);
	y1 = random_range(-1,1);
}

drawoffset = 0;
function drawnight(x, c1, c2, topheight, nightstring, nightnum) {
	draw_rectangle_color(x-100+drawoffset,topheight-nightlist[nightnum],x+100+drawoffset,room_height, c1, c1, c2, c2, false);
	draw_set_color(c_white);
	if nightnum = 6 draw_set_color(c_purple);
	draw_text(x + drawoffset - string_width(nightstring)/2,topheight - 100 - nightlist[nightnum],nightstring);
	draw_set_color(c_white);
	if !(throwout) {
		if mouse_x < x + 100 + drawoffset && mouse_x > x - 100 + drawoffset && mouse_y < 600 && !(throwout) nightlist[nightnum] = (nightlist[nightnum] + 200)/2;
		else nightlist[nightnum] = (nightlist[nightnum])/2;
	} else nightlist[nightnum] = (nightlist[nightnum]-500)/2;
	if mouse_check_button_pressed(mb_left) && !(instance_exists(obj_fadeout)) && mouse_x < x + 100 + drawoffset && mouse_x > x - 100 + drawoffset && mouse_y < 600 && !(throwout) {
		if nightnum = 5 {
			//Custom Night
			instance_create_layer(768,y,"Buttons", obj_custom_night_menu);
			throwout = true;
			xv1 = random_range(-15,15);
			yv1 = random_range(-10,-20);
		} else {
			var fadeout = instance_create_layer(x,y,"Fadeout", obj_fadeout);
			fadeout.roomset = rm_nightdisplay;
			night = nightnum+1;
			audio_play_sound(sfx_select,10,false);
		}
	}
}

var scroll = room_width/2+(mouse_x-room_width/2)*-1;
sinthing+=0.1;

var crender = make_color_rgb(255,217,0);

drawoffset = 0;
switch nightsunlocked {
	case 1: drawoffset = 1200; break;
	case 2: drawoffset = 1000; break;
	case 3: drawoffset = 800; break;
	case 4: drawoffset = 600; break;
	case 5: drawoffset = 400; break;
	case 6: case 7: drawoffset = 0; break; //Massive offset difference due to the fact 2 nights are added
}

switch nightsunlocked {
	case 7: case 6:
		crender = make_color_rgb(104+sin(sinthing)*25,3,138+sin(sinthing)*20);
		drawnight(scroll+1200, crender, c_black, room_height/2, "Death Wish", 6);
		crender = make_color_rgb(255,0,93);
		drawnight(scroll+800, crender, c_black, room_height/2, "Custom", 5);
	case 5:
		crender = make_color_rgb(255,0,51);
		drawnight(scroll+400, crender, c_black, room_height/2, "Night 5", 4);
	case 4:
		drawnight(scroll, c_red, c_black, room_height/2, "Night 4", 3);
	case 3:
		crender = make_color_rgb(255,34,0);
		drawnight(scroll-400, crender, c_black, room_height/2, "Night 3", 2);
	case 2:
		crender = make_color_rgb(255,106,0);
		drawnight(scroll-800, crender, c_black, room_height/2, "Night 2", 1);
	case 1:
		var crender = make_color_rgb(255,217,0);
		drawnight(scroll-1200, crender, c_black, room_height/2, "Night 1", 0);
	break;
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
		obj_menu.alphastate = false;
	}
}
draw_text(_x,_y, str);
draw_set_color(c_white);

if y1 > 500 instance_destroy(self);
