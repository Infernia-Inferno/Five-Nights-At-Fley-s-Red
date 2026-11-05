time_until_appear = max(time_until_appear-1,0);
if time_until_appear = 0 {
	if !(sfx) {
		audio_play_sound(sfx_pizza_time,10,0);
		sfx = true;
	}
	x = (x+1088)/2;
}
if round(x) = 1088 time_until_toss = max(time_until_toss-1,0);
if time_until_toss = 0 {
	sprite_index = spr_bootleg_fley_throw;
	if thrown = 0 instance_create_layer(x+40,y+40,"Jumpscares", obj_thrownpizza);
	thrown++;
	if thrown = 20 instance_destroy(self);
}
