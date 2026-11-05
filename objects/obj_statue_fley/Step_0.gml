if !(instance_exists(obj_pausescreen)) && (!(mouse_x < x + 350 && mouse_x > x - 350 && mouse_y < y + 30 && mouse_y > y - 700) || obj_control.cam_up) patience_left = max(0,patience_left-1); 
else if !(instance_exists(obj_pausescreen)) patience_left+=0.2;
if patience_left = 0 && !(instance_exists(obj_jumpscares)) && !(instance_exists(obj_6am)){
	var jumpscare = instance_create_layer(x,y,"Jumpscares", obj_jumpscares);
	jumpscare.num = 5;
}
if !(instance_exists(obj_pausescreen)) && !(instance_exists(obj_6am))time_left--;
if time_left = 0 && !(instance_exists(obj_jumpscares) || game_over){
	instance_create_layer(0,0, "Fadeout", obj_statue_dissapear);
	instance_destroy(self);
}
