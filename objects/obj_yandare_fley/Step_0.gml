time_left--;
if time_left = 0 {
	instance_create_layer(0,0, "Fadeout", obj_statue_dissapear);
	obj_control.yandare_timer = 140*60 - obj_control.yandare_ai*random_range(3,5.2)*60;
	obj_control.yandare_inlounge = true;
	instance_destroy(self);
}
if active time_until_kill++;
if obj_control.flashlight && (mouse_x < x + 350 && mouse_x > x - 350 && mouse_y < y + 60 && mouse_y > y - 800) time_until_kill-=2.5;
if time_until_kill < destroy {
	active = false;
	image_alpha = max(0,image_alpha-0.05);
	if savedata[2].monika sprite_index = spr_monika_fley_disabled;
	else sprite_index = spr_yandare_fley_disabled;
	if image_alpha = 0 {
		obj_control.yandare_timer = 140*60 - obj_control.yandare_ai*random_range(3,5.2)*60;
		obj_control.yandare_inlounge = true;
		instance_destroy(self);
	}
}
if time_until_kill > 120 && !(instance_exists(obj_jumpscares)) && !(instance_exists(obj_6am)) && !(game_over){
	var jumpscare = instance_create_layer(x,y,"Jumpscares", obj_jumpscares);
	if savedata[2].monika jumpscare.num = 9;
	else jumpscare.num = 8;
	instance_destroy(self);
}
