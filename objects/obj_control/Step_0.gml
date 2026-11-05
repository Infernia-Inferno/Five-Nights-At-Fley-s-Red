//View
if exposuremax > 30 exposuremax--;
if exposuremax < 30 exposuremax++;
var cam = view_camera[0];
if !(game_over) && !(instance_exists(obj_pausescreen)){
if instance_exists(obj_jumpscares) {
	cam_up = false;
	if obj_jumpscares.num = 7 x = (x + (1500) * 0.5)/1.5;
	else x = (x + (room_width/2) * 0.5)/1.5;
	y = (y + (room_height/2) * 0.5)/1.5;
} else {
x = room_width/2 + (mouse_x - x)/2;
y = room_height/2 + (mouse_y - y)/2;
}
camera_set_view_pos(cam, x-720+screenshake*random_range(-1,1), y-405+screenshake*random_range(-1,1));
if !(instance_exists(obj_pausescreen)) screenshake = max(screenshake-1,0);
//Camera
var sdisable = false;
if instance_exists(obj_stick_bug_fley) if obj_stick_bug_fley.active = 1 sdisable = true;
if keyboard_check_pressed(vk_space) && !instance_exists(obj_jumpscares) && !(game_over) && !(instance_exists(obj_pausescreen)) && !(sdisable) {
	if tutorial_num = 3 tutorial_status = 1;
	cam_up = !(cam_up);
	astleyframe = 0;
	if !(cam_up) {
		obj_door.doorsprite = spr_door;
		if round(random_range(0, 200)) < 1 obj_door.doorsprite = spr_door_windows;
		else if round(random_range(0, 1000)) < 1 obj_door.doorsprite = spr_door_gnomed;
		rickroll = false;
		audio_stop_sound(mus_never_gonna_give_you_up);
		//Statue Fley
		if random_range(1,25) <= statue && !(instance_exists(obj_statue_fley)) statue_approach = max(0,statue_approach-1*exposure/30);
		if statue_approach = 0 && !(testmode){
			instance_create_layer(random_range(512,1728),random_range(992,1024),"instances", obj_statue_fley);
			statue_approach = round(random_range(3,6));
		} else if yandare_timer = 0 && !(testmode) {
			if !(instance_exists(obj_yandare_fley)) {
				var yan = instance_create_layer(1536,928,"instances", obj_yandare_fley);
				if savedata[2].monika yan.sprite_index = spr_monika_fley_active;
			}
		}
	}
	if cam_up = false obj_desk.update_plush = true;
	audio_play_sound(sfx_cam,2,0);
	staticalpha = 1;
	exposure+=40;
}
if cam_up cam_y = min((cam_y+0)/2,0);
else cam_y = max((cam_y-810)/2,-810);
if keyboard_check_pressed(ord("D")) && !instance_exists(obj_jumpscares) && !(cam_up) && !(game_over) && !(instance_exists(obj_pausescreen)) && door_health > 0 && !(obj_door.destroy){
	obj_door.open = !(obj_door.open);
	 if (!obj_door.open) && obj_door.doorsprite = spr_door_gnomed audio_play_sound(sfx_hooh,4,0);
	audio_play_sound(sfx_door,4,0);
	exposure+=50;
	if tutorial_num = 1 tutorial_status = 1;
}
if !(instance_exists(obj_pausescreen)) && !(instance_exists(obj_6am)) {
	if !(turbo_ai = 0) turbo_power=max(0,turbo_power-turbo_ai*0.0028*turbo_drain);
	//0.0022 was the old one
	turbo_drain=min(1,turbo_drain+0.0018);
	if !(obj_door.destroy) {
		if !(obj_door.open) door_health = max(0,door_health-0.5);
		else door_health = min(door_health+0.6,2000);
	}
	if obj_control.door_health <= 0 && obj_door.destroy = false{
		obj_door.destroy = true;
		obj_door.yv = 0;
		obj_door.xv = 0;
		obj_door.open = false;
		audio_play_sound(sfx_yoda_frikin_dies, 20,false);
	}
	if turbo_power = 0 && !(testmode) turbo_outage = true;
	if turbo_outage time_until_imminent_destruction = max(time_until_imminent_destruction-1,0);
	if time_until_imminent_destruction = 0 && !(cam_up) && !(instance_exists(obj_jumpscares)) && !(game_over){
		var jumpscare = instance_create_layer(x,y,"Jumpscares", obj_jumpscares);
		jumpscare.num = 2;
	}
	if !(stick_bug_ai = 0) {
		stick_bug_timer = max(stick_bug_timer-1,0);
		if stick_bug_timer = 0 && !(cam_up) && !(testmode){
			if !(instance_exists(obj_stick_bug_fley)) instance_create_layer(x,y,"Jumpscares", obj_stick_bug_fley);
			else {
				if !(obj_stick_bug_fley.active) stick_bug_timer = 140*60 - stick_bug_ai*random_range(4,5)*60;
			}
		}
	}
	
	if !(yandare_ai = 0) {
		yandare_timer = max(yandare_timer-1,0);
		if yandare_timer = 0 yandare_inlounge = false;
	}
}
if keyboard_check_pressed(ord("O")) && testmode instance_create_layer(x,y,"Jumpscares", obj_6am);
if keyboard_check_pressed(ord("P")) && testmode {
	//Jumpscare debug
	var jumpscare = instance_create_layer(x,y,"Jumpscares", obj_jumpscares);
	jumpscare.num = 11;
}
} else {
	camera_set_view_pos(cam, x-720, y-405);
}

//show_debug_message(exposuremax);
//show_debug_message(exposure);

//Pause
if keyboard_check_pressed(vk_escape) && !(game_over) && !(instance_exists(obj_jumpscares)){
	if instance_exists(obj_pausescreen) {
		instance_destroy(obj_pausescreen);
		audio_resume_sound(mus_a_hat_in_time_vanessa_wants_to_play);
	} else {
		audio_pause_sound(mus_a_hat_in_time_vanessa_wants_to_play);
		instance_create_layer(camera_get_view_x(cam),camera_get_view_y(cam),"GameOverScreen", obj_pausescreen);
	}
}

if tutorial_num = 5 tutorial_end--;
if tutorial_end = 0 tutorial_status = 1;
if tutorial_num = 6 show_tutorial = false;
warning_sin+=0.2;
if aiupdate {
	aiupdate = false;
	switch obj_desk.hour {
		case 1:
		
		break;
		case 2:
			switch night {
				case 1:
					paint.ai = 2;
				break;
			}
		break;
		case 3:
			switch night {
				case 1:
					yandare_ai = 3;
				break;
				case 2:
					turbo_ai = 7;
				break;
				case 7:
				instance_create_layer(x,y,"Instances",obj_bootleg_fley);
				break;
			}
		break;
		case 4:
			switch night {
				case 1:
					fley.ai_level = 4;
					paint.ai = 4;
				break;
			}
		break;
		case 5:
			switch night {
				case 1:
					yandare_ai = 6;
				break;
			}
		break;
		case 6:
			switch night {
				case 1:
					turbo_ai = 6;
				break;
			}
		break;
	}
}
