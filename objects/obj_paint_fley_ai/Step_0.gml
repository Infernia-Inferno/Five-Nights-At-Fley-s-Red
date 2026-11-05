if instance_exists(obj_jumpscares) || instance_exists(obj_6am) instance_destroy(self);
if obj_control.cam_up && !(instance_exists(obj_pausescreen)){
	if groob = 0 && obj_control.camera = 2 scouttf2 = 0;
	locked = random_range(60, 300);
	if obj_control.camera = 3 locked = random_range(120, 540);
	locked++;
}
if locked = 0 && !(instance_exists(obj_pausescreen)) && !(ai = 0){
	groob = max(groob-1,0);
}
locked = max(locked-1, 0);
if groob = 0 && !(instance_exists(obj_pausescreen)){
	arcade = false;
	scouttf2 = max(scouttf2-1,0);
}
if scouttf2 = 0 && !(arcade) && !(instance_exists(obj_pausescreen)){
	foxymoment = min(foxymoment+1, 100);
	if (foxymoment/2 - ceil(foxymoment/2)) = 0 {
		var r = round(random_range(1,5));
		switch r {
			case 1: audio_play_sound(sfx_table_slap1,1,0); break;
			case 2: audio_play_sound(sfx_table_slap2,1,0); break;
			case 3: audio_play_sound(sfx_table_slap3,1,0); break;
			case 4: audio_play_sound(sfx_table_slap4,1,0); break;
			case 5: audio_play_sound(sfx_table_slap5,1,0); break;
		}
	}
	if foxymoment = 100 {
		//Impact
		if !(obj_door.open) obj_control.door_health-=600;
		if (obj_control.door_health <= 0 || obj_door.open) && !(testmode) createjumpscare(-1);
		else {
			foxymoment = 0;
			groob = 21 * 60 * random_range(0.7,1.3) * (1+(25-ai)/10);
			groobiness = groob;
			arcade = true;
			scouttf2 = 761;
			audio_play_sound(sfx_desk_slam_1,10,0);
			obj_door.hurtanim = 40;
		}
	}
}
