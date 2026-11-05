if destroy && !(instance_exists(obj_pausescreen)) {
	open = true;
	x+=xv;
	y+=yv;
	yv++;
	rot-=xv;
} else if !(game_over) && !(instance_exists(obj_pausescreen)){
	if (open) y = (y + 96)/2;
	else y = (y + 736)/2;
	glowvar+=0.1;
	if !(position_meeting(mouse_x,mouse_y, self)) || (instance_exists(obj_jumpscares)) || game_over glowvar = 0;
	else if mouse_check_button_pressed(mb_left) && obj_control.cam_up = 0  && !(instance_exists(obj_jumpscares)) && !(game_over){
		open = !(open);
		audio_play_sound(sfx_door,4,0);
		obj_control.exposure+=50;
	}
}
