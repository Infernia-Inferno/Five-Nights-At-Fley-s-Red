yoffset+=yv*1.5;
if !(fall_left = 0) || shake_left <= 0 {
	yv++;
	image_angle++;
} else yv = 0;
y = obj_control.y+yoffset;
x = obj_control.x + xoffset;
if !(shake_dir) && mouse_x < room_width/2 - 200 && active {
	shake_left-=1;
	image_angle+=random_range(10, 12);
	xoffset+=random_range(-1,-12);
	yoffset+=random_range(-6,-6);
	shake_dir = true;
	waugh = 10;
} else if shake_dir && mouse_x > room_width/2 + 200 && active {
	shake_left-=1;
	image_angle-=random_range(10, 12);
	xoffset-=random_range(-1,-12);
	yoffset+=random_range(-6,-6);
	shake_dir = false;
	waugh = 10;
}
/*
shake_left -= abs(_x - x);
image_angle -= (_x - x)*0.01;
shake_left -= abs(_y - y); */

fall_left = max(0,fall_left-1);
if instance_exists(obj_jumpscares) {
	if obj_jumpscares.num = 5 instance_destroy(self);
}
if shake_left <= 0 && active || instance_exists(obj_jumpscares) && active || instance_exists(obj_6am) && active { 
	active = false;
	audio_stop_sound(sfx_get_stick_bugged_lol);
	audio_play_sound(sfx_yoda_frikin_dies,9,0);
	waugh = 999;
	fall_left = 0;
}
image_xscale+=0.01470588235;
if image_xscale > 1 image_xscale = 1;
image_yscale = image_xscale;
if yv > 50 instance_destroy(self);
if waugh > 0 sprite_index = spr_stick_bug_jumpscare_2;
else sprite_index = spr_stick_bug_jumpscare;
waugh = max(waugh-1,0);
