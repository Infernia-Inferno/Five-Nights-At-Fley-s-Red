var _x = x + camera_get_view_x(view_camera[0]) * 0.3 + 390;
var _y= y + camera_get_view_y(view_camera[0]) * 0.3 + 180;
if !(game_over) {
if update_plush && !(testmode) && !(instance_exists(obj_pausescreen)){
	//Plush Fley Act
	update_plush = false;
	if random_range(1,25) <= plush_ai {
		//Succeed
		switch plush_fley_sprite {
			case spr_plush_fley_grenade: plush_fley_sprite = spr_plush_fley; break;
			case spr_plush_fley: 
			if random_range(0,1) > 0.5 plush_fley_sprite = spr_plush_fley_gun; 
			else plush_fley_sprite = spr_plush_fley_grenade; 
			break;
			case spr_plush_fley_gun: 
			//Plush Jumpscare
			noplush = true;
			unsquishable = 1;
			plush_fley_sprite = spr_plush_fley; 
			var jumpscare = instance_create_layer(x,y,"Jumpscares", obj_jumpscares);
			jumpscare.num = 0;
			break;
		}
	}
}

if !(game_over) && !(instance_exists(obj_pausescreen)) {
	squishx = (squishx + 2) / 3;
	squishy = (squishy + 1) / 2;
	squishsin+=0.3;
	squishysin=sin(squishsin);
	bouncefactor = max(bouncefactor-0.03,0);
}
if bouncefactor = 0 && plush_fley_sprite = spr_plush_fley_gooned plush_fley_sprite = spr_plush_fley; 
if mouse_x < _x + 157 && mouse_x > _x - 157 && mouse_y < _y && mouse_y > _y - 349 && !(unsquishable) && !(obj_control.cam_up) && !(game_over) && !(instance_exists(obj_pausescreen)){
	//Squish / Click
	plushfleyglow = 0.25;
	if mouse_check_button_pressed(mb_left) {
		if plush_fley_sprite = spr_plush_fley_grenade {
			//Explode Death
			var explosion = instance_create_layer(_x,_y,"Instances", obj_explosion);
			obj_control.screenshake+=40;
			explosion.image_xscale = 8;
			explosion.image_yscale = 8;
			explosion.depth--;
			unsquishable = true;
		} else {
			//Ordinary Squish
			audio_play_sound(sfx_squish,2,0);
			obj_control.exposure += 6;
			plush_fley_sprite = spr_plush_fley_gooned;
			squishx = 2;
			squishy = 0.2;
			bouncefactor = 1;
			squishsin = 0;
			squishysin = 0.1;
		}
	}
} else plushfleyglow = 0;
}
if !(instance_exists(obj_jumpscares)) && !(game_over) && !(instance_exists(obj_pausescreen)) time_until_hour_tick--;
if time_until_hour_tick = 0 {
	hour++;
	time_until_hour_tick = 3000;
	//50 seconds per hour cuz this game is hard
	obj_control.aiupdate = true;
	if hour = 6 instance_create_layer(x,y,"Fadeout",obj_6am);
}
