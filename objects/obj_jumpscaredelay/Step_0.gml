delay--;
if delay <= 0 && !(instance_exists(obj_jumpscares)) && !(game_over){
	createjumpscare(fley)
	instance_destroy(self);
}
