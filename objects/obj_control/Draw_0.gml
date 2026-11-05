//Darkness / Flashlight
draw_set_color(c_black);
var flashlight_str = 1;
if death_wish flashlight_str = 0.69;
flashlight = false;
if keyboard_check(ord("W")) && !(game_over) && !(instance_exists(obj_pausescreen)) && !(flashlight_power <= 0){
	flashlightmodifier=min(1.5,flashlightmodifier+0.07);
	flashlight_power = max(0,flashlight_power-0.3);
	if flashlight_power = 0 audio_play_sound(sfx_glass_smash,10,0);
	exposuremax=60;
	if tutorial_num = 2 tutorial_status = 1;
	flashlight = true;
	//exposure = min(30,exposure+1);
} else if (keyboard_check(ord("S")) && !(cam_up) && !(game_over) && !(instance_exists(obj_pausescreen))) || (flashlight_power <= 0){
	flashlightmodifier=0;
	exposuremax = 0;
	if tutorial_num = 0 tutorial_status = 1;
} else if !(game_over) && !(instance_exists(obj_pausescreen)){
	flashlightmodifier=max(1,flashlightmodifier-0.04);
	if !(cam_up) flashlight_power = min(flashlight_power+0.2,100);
	//exposure = min(exposuremax,exposure+1);
}
//Exposure - affects certain game mechanics
if !(instance_exists(obj_pausescreen)) {
	if exposure > exposuremax exposure--;
	else exposure++;
	if exposure > 300 exposure = 300;
}

flashlight_str*=flashlightmodifier;
if instance_exists(obj_explosion) {
	expmodifier = obj_explosion.image_index/17;
} else expmodifier = max(0, expmodifier-0.1);
flashlight_str*= (1+expmodifier)
if !(game_over) && !(instance_exists(obj_pausescreen)){
	if instance_exists(obj_jumpscares) {
		if obj_jumpscares.num = 7 mx = (mx + 2000)/2;
		else mx = (mx + room_width/2)/2;
		my = (my + room_height/2)/2;
	} else {
		mx = mouse_x;
		my = mouse_y;
	}
}

if !(surface_exists(darksurf)) {
	darksurf = surface_create(2240, 1410);
}
surface_set_target(darksurf)
draw_clear_alpha(c_white,0);
//Darkness Surface
draw_rectangle(0,0,room_width, my-508*flashlight_str, false);
draw_rectangle(0,my+508*flashlight_str,room_width, room_height, false);
draw_rectangle(0,my-508*flashlight_str,mx-508*flashlight_str, my+508*flashlight_str, false);
draw_rectangle(mx+508*flashlight_str,my-508*flashlight_str,room_width, my+508*flashlight_str, false);
draw_sprite_ext(spr_darkness_overlayer,0,mx,my,flashlight_str,flashlight_str,0,c_black,1);
draw_sprite_ext(spr_darkness_overlayer,0,mx,my,flashlight_str,flashlight_str,0,c_black,1);
draw_sprite_ext(spr_darkness_overlayer,0,mx,my,flashlight_str,flashlight_str,0,c_black,1);
surface_reset_target();

var darkalpha = 0.8;
draw_set_alpha(darkalpha);
if drawhuds draw_surface(darksurf,0,0);
draw_set_alpha(1);


if drawhuds {
var _metervarx = x-720+5;
var _metervary = y-405+5;
draw_sprite_ext(spr_meter_flashlight,0,_metervarx,_metervary,1,1,0,c_white,1);
draw_rectangle(_metervarx+340,_metervary, _metervarx+(330*(flashlight_power/100)), _metervary+54, false);
_metervary+=60;
draw_sprite_ext(spr_meter_door,0,_metervarx,_metervary,1,1,0,c_white,1);
draw_rectangle(_metervarx+340,_metervary, _metervarx+(330*(door_health/2000)), _metervary+54, false);
}

function drawsprite(sprite, _x, _y, xdiv, camsprite) {
	draw_sprite_ext(sprite,0,_x+room_width/2-sprite_get_width(camsprite)/2+(x-room_width/2)/xdiv,(_y+room_height/2-sprite_get_height(camsprite)/2+(y-room_height/2)/6),1,1,0,c_white,1);
}
function drawsprite_ext(sprite, _x, _y, xdiv, camsprite, rot, xscale, yscale, alpha) {
	draw_sprite_ext(sprite,0,_x+room_width/2-sprite_get_width(camsprite)/2+(x-room_width/2)/xdiv,(_y+room_height/2-sprite_get_height(camsprite)/2+(y-room_height/2)/6),xscale,yscale,rot,c_white,alpha);
}

//Camera
draw_rectangle(x-710,y-390-cam_y, x+710, y+420-cam_y, false);
draw_set_color(c_white);
if ceil(cam_y) > -30 && !(instance_exists(obj_jumpscares)) && !(instance_exists(obj_6am)){
	var xdiv = 3;
	if camera = astley.myroom {
		draw_sprite_ext(spr_rickroll,astleyframe,x,y-cam_y,1.5,1.5,0,c_white,1);
		astleyframe+=0.56;
	} else {
		audio_stop_sound(mus_never_gonna_give_you_up);
		rickroll = false;
		switch camera {
		case 1: var camsprite = spr_hallway_a;
		drawsprite(spr_hallway_a,0,0,3, camsprite);
		if fley.myroom = 1 || testmode {
			if savedata[2].female drawsprite(spr_fem_hall_a, 114, 555, xdiv, camsprite);
			else drawsprite(spr_fley_hall_a, 114, 555, xdiv, camsprite);
		}
		if s_crown_fley.myroom = 1 || testmode drawsprite(spr_super_crown_fley_hall_a, 1635, 497, xdiv, camsprite);
		break;
		case 2: var camsprite = spr_hallway_b;
		drawsprite(spr_hallway_b,0,0,3, camsprite);
		var paintdashframe = paint.foxymoment/100*90;
		if paintdashframe = 91 paintdashframe = 0;
		var mspaintx = (1353+(-1422*(paintdashframe/90)));
		var mspainty = (256.3+(1336.9*(paintdashframe/90)));
		if paintdashframe < 15 && paint.arcade = false drawsprite_ext(spr_ms_paint_fley, mspaintx, mspainty, xdiv, camsprite, random_range(-5,5), random_range(0.9, 1.1), random_range(0.9, 1.1), 1);
		if fley.myroom = 2 || testmode {
			if savedata[2].female drawsprite(spr_fem_hall_b, 1218, 463, xdiv, camsprite);
			else drawsprite(spr_fley_hall_b, 1218, 463, xdiv, camsprite);
		}
		if s_crown_fley.myroom = 2 || testmode drawsprite(spr_super_crown_fley_hall_b, 446, 583, xdiv, camsprite);
		if paintdashframe >= 15 && paint.arcade = false drawsprite_ext(spr_ms_paint_fley, mspaintx, mspainty, xdiv, camsprite, random_range(-5,5), random_range(0.9, 1.1), random_range(0.9, 1.1), 1);
		if clown.myroom = 2 || testmode drawsprite(spr_clown_hall_b, 1384, 1090, 2, camsprite);
		break;
		case 3: var camsprite = spr_arcade_back; 
		drawsprite(spr_arcade_back,0,0,3, camsprite);
		if s_crown_fley.myroom = 3 || testmode drawsprite(spr_super_crown_fley_arcade, 1597, 446, 3, camsprite);
		if clown.myroom = 3 || testmode drawsprite(spr_clown_arcade, 1241, 630, 3, camsprite);
		if paint.arcade drawsprite(spr_ms_paint_fley, 465 + random_range(-20,20)*(1-(paint.groob/paint.groobiness)), 477 + random_range(-20,20)*(1-(paint.groob/paint.groobiness)), 3.5, camsprite);
		if fley.myroom = 3 || testmode {
			if savedata[2].female drawsprite(spr_fem_arcade, 293, 1154, 4, camsprite);
			else drawsprite(spr_fley_arcade, 293, 1154, 4, camsprite);
		}
		drawsprite(spr_arcade_front,0,0,4, spr_arcade_front);
		break;
		case 4: drawsprite(spr_dining_room_back,0,0,-0.8, spr_dining_room_back);
		if s_crown_fley.myroom = 4 || testmode drawsprite(spr_super_crown_fley_dining_room,431,502,-0.8, spr_dining_room_back);
		if clown.myroom = 4 || testmode drawsprite(spr_clown_dining_room,1160,585,-0.8, spr_dining_room_back);
		drawsprite(spr_dining_room_middle,1545.55,610.9,-0.8, spr_dining_room_back);
		drawsprite(spr_dining_room_front,2107.5,436.15,-0.8, spr_dining_room_back);
		if fley.myroom = 4 || testmode {
			if savedata[2].female drawsprite(spr_fem_dining_room,1920,160,-0.8, spr_dining_room_back);
			else drawsprite(spr_fley_dining_room,1920,160,-0.8, spr_dining_room_back);
		}
		break;
		case 5: var camsprite = spr_kitchen_back; 
		drawsprite(spr_kitchen_back,0,0,3, camsprite);
		//Button
		var b = spr_kitchen_button;
		if button_pushed > 0 b = spr_kitchen_button2;
		button_pushed = max(button_pushed-1,0);
		drawsprite(b,497,329,3, camsprite);
		var _x = 497 + room_width/2-sprite_get_width(camsprite)/2+(x-room_width/2)/3;
		var _y = 329+room_height/2-sprite_get_height(camsprite)/2+(y-room_height/2)/6;
		if mouse_x < _x + 120.5 && mouse_x > _x - 120.5 && mouse_y < _y + 124 && mouse_y > _y - 124 && button_pushed = 0 {
			//Hovering
			gpu_set_fog(1, c_white, 0, 99);
			drawsprite_ext(spr_kitchen_button,497,329,3, camsprite, 0, 1, 1, 0.25);
			gpu_set_fog(0, c_white, 0, 99);
			if mouse_check_button_pressed(mb_left) {
				button_pushed = 5;
				instance_create_layer(x,y,"Instances",obj_bootleg_fley);
				audio_play_sound(sfx_table_slap1,1,false);
			}
		}
		if s_crown_fley.myroom = 5 || testmode drawsprite(spr_super_crown_fley_kitchen,815,481,3, camsprite);
		if fley.myroom = 5 || testmode {
			if savedata[2].female drawsprite(spr_fem_kitchen,1495,506,3, camsprite);
			else drawsprite(spr_fley_kitchen,1495,506,3, camsprite);
		}
		drawsprite(spr_kitchen_fire,1169,658,3, camsprite);
		break;
		case 6: var camsprite = spr_back_room; 
		drawsprite(spr_back_room_back,0,0,1.5, camsprite);
		if fley.myroom = 6 || testmode {
			if savedata[2].female drawsprite(spr_fem_back_room,631,180,2, camsprite);
			else drawsprite(spr_fley_back_room,631,180,2, camsprite);
		}
		drawsprite(spr_back_room_middle,0,0,2, camsprite);
		drawsprite(spr_back_room,0,0,3, camsprite);
		if s_crown_fley.myroom = 6 || testmode drawsprite(spr_super_crown_fley_back_room,570,488,3, camsprite);
		break;
		case 7: var camsprite = spr_lounge_back;
		if turbo_outage drawsprite(spr_lounge_back_2,0,0,3, camsprite);
		else drawsprite(spr_lounge_back,0,0,3, camsprite);
		if edgy.myroom = 7 || testmode drawsprite(spr_edgy_fley_lounge,676,649,3, camsprite);
		drawsprite(spr_lounge_middle,832,535,3, camsprite)
		if fley.myroom = 7 || testmode {
			if savedata[2].female drawsprite(spr_fem_lounge,508,482,3, camsprite);
			else drawsprite(spr_fley_lounge,508,482,3, camsprite);
		}
		if yandare_inlounge && !(instance_exists(obj_yandare_fley)){
			if savedata[2].monika drawsprite(spr_monika_fley_cam,1017.5,433,3, camsprite);
			else drawsprite(spr_yandare_fley_cam,1017.5,433,3, camsprite);
		}
		if s_crown_fley.myroom = 7 || testmode drawsprite(spr_super_crown_fley_lounge,197,837,3.5, camsprite);
		if testmode && keyboard_check_pressed(ord("P")) {
			switch chairsprite {
				case spr_turbo_chair: chairsprite = spr_turbo_1; break;
				case spr_turbo_1: chairsprite = spr_turbo_2; break;
				case spr_turbo_2: chairsprite = spr_turbo_chair; break;
			}
		} else {
			if turbo_outage {
				if time_until_imminent_destruction = 0 chairsprite = spr_turbo_chair;
				else chairsprite = spr_turbo_2;
			} else chairsprite = spr_turbo_1;
		}
		drawsprite(chairsprite,1005,973,3.5, camsprite);
		drawsprite(spr_lounge_front,1825.9,732.5,4, camsprite)
		break;
		case 8: var camsprite = spr_vent_a; 
		drawsprite(spr_vent_a,0,0,3, camsprite);
		if stick_bug_timer > 0 || testmode drawsprite(spr_stick_bug_a1,653,975,3, camsprite);
		if fley.myroom = 8 || testmode {
			if savedata[2].female drawsprite(spr_fem_vent_a,1561,589,3, camsprite);
			else drawsprite(spr_fley_vent_a,1561,589,3, camsprite);
		}
		break;
		case 9: var camsprite = spr_vent_a_2; 
		drawsprite(spr_vent_a_2,0,0,3, camsprite);
		if stick_bug_timer = 0 || testmode drawsprite(spr_stick_bug_a2,880,173,3, camsprite);
		if fley.myroom = 9 || testmode {
			if savedata[2].female drawsprite(spr_fem_vent_a_2,1144,980,3, camsprite);
			else drawsprite(spr_fley_vent_a_2,1144,980,3, camsprite);
		}
		break;
		case 10: var camsprite = spr_vent_b; 
		drawsprite(spr_vent_b,0,0,3, camsprite);
		if edgy.myroom = 10 || testmode drawsprite(spr_edgy_fley_vent_b,1439,557,3, camsprite);
		if fley.myroom = 10 || testmode {
			if savedata[2].female drawsprite(spr_fem_vent_b,419,555,3, camsprite);
			else drawsprite(spr_fley_vent_b,419,555,3, camsprite);
		}
		break;
	}
	}
	//draw_sprite_ext(camsprite,0,room_width/2-sprite_get_width(camsprite)/2+(x-room_width/2)/xdiv,room_height/2-sprite_get_height(camsprite)/2+(y-room_height/2)/6,1,1,0,c_white,1);
	draw_sprite_ext(spr_darkness_overlayer,0,x,y,1.5,1.5,0,c_white,1);
	draw_set_color(c_black);
	draw_set_alpha(camfade);
	draw_rectangle(x-710,y-390-cam_y, x+710, y+420-cam_y, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	camfade = max(camfade-0.1,0);
}
staticframe+=1;
staticalpha=max(staticalpha-0.1,0.05);
if !(cam_y = -810 ) {
	draw_sprite_ext(spr_static,staticframe,x-720,y-405-cam_y,2.88,1.73,0,c_white,staticalpha);
	if camera = 7 && ceil(cam_y) > -30{
		draw_set_color(c_black);
		draw_rectangle(x-620, y+262, x-620+508, y+338, false);
		draw_set_color(c_yellow);
		draw_rectangle(x-620, y+270, x-620+turbo_power*5, y+330, false);
		draw_set_color(c_white);
		var _x = x-620;
		var _y = y+300;
		draw_sprite_ext(spr_turbo_power,0,_x,_y,1,1,0,c_white,1);
		gpu_set_fog(1, c_white, 0, 99);
		if mouse_x < _x + 48 && mouse_x > _x - 48 && mouse_y < _y + 48 && mouse_y > _y - 48 {
			draw_sprite_ext(spr_turbo_power,0,_x,_y,1,1,0,c_white,0.3);
			if mouse_check_button(mb_left) && !(turbo_outage){
				turbo_power = min(100, turbo_power+1.6);
				turbo_drain = max(0,turbo_drain/1.5);
			}
		}
		gpu_set_fog(0, c_white, 0, 99);
		draw_set_font(fnt_power);
		draw_text(_x+50,_y-70, string_insert("GC Power: ", string_insert(round(turbo_power),"%",1),1));
	}
	draw_sprite_ext(spr_camera_map,0,x-720+901,y-405+404-cam_y,1,1,0,c_white,0.5);
	draw_sprite_ext(spr_camera,0,x-720,y-405-cam_y,1,1,0,c_white,1);
}

//Camera:
//1 - Hall A
//2 - Hall B
//3 - Arcade
//4 - Dining Room
//5 - Kitchen
//6 - Back Room
//7 - Lounge
//8 - Vent A-1
//9 - Vent A-2
//10 - Vent B

function camerabuttondraw(drawx, drawy, num) {
	var buttonsize = 1;
	var buttonalpha = 0.6;
	var _x = x-720+drawx+20;
	var _y = y-405-cam_y+drawy+20;
	if num = camera {
		buttonalpha = 0.8;
		buttonsize = 1.1;
	}
	if mouse_x < _x + 40 && mouse_x > _x - 40 && mouse_y < _y + 40 && mouse_y > _y - 40 {
		buttonsize = 1.2;
		buttonalpha = 0.8;
		if mouse_check_button_pressed(mb_left) && !(camera = num){
			if tutorial_num = 4 tutorial_status = 1;
			astleyframe = 0;
			camera = num;
			camfade = 1;
			staticalpha = 1;
			audio_play_sound(sfx_camera_blip,4,0);
			exposure+=25;
			audio_stop_sound(mus_never_gonna_give_you_up);
			rickroll = false;
		}
	}
	draw_sprite_ext(spr_camerabutton,0,_x,_y,buttonsize,buttonsize,0,c_white,buttonalpha);
}
if instance_exists(astley) if camera = astley.myroom && rickroll = false && cam_up {
	audio_play_sound(mus_never_gonna_give_you_up,10,0);
	rickroll = true;
}
camerabuttondraw(914.925,651, 7); //Lounge
camerabuttondraw(1598*0.75,704*0.75, 8); //Vent A-1
camerabuttondraw(1397*0.75,769*0.75, 9); //Vent A-2
camerabuttondraw(1405*0.75,944*0.75, 10); //Vent B
camerabuttondraw(1440*0.75,855*0.75, 1); //Hall A
camerabuttondraw(1733*0.75,827*0.75, 2); //Hall B
camerabuttondraw(1806*0.75,539*0.75, 3); //Arcade
camerabuttondraw(1495*0.75,624*0.75, 4); //Dining Room
camerabuttondraw(1330*0.75,661*0.75, 5); //Kitchen
camerabuttondraw(1280*0.75,746*0.75, 6); //Back Room

sauce_timer = max(0,sauce_timer-1);
if sauce_timer = 0 saucealpha = max(0,saucealpha-0.01);
draw_sprite_ext(spr_sauce,0,x,y,1,1,0,c_white,saucealpha);

if death_wish {
	draw_set_color(c_purple);
	draw_set_alpha(0.15+abs(sin(staticframe/20))*0.05);
	draw_rectangle(0,0,room_width, room_height, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}
