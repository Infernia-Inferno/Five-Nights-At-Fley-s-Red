if !(game_over) {
	shake = max(0,time_until_kill);
	r1 = random_range(shake*-0.1,shake*0.1);
	r2 = random_range(shake*-0.1,shake*0.1);
}
draw_sprite_ext(sprite_index,0,x+r1,y+r2,1,1,0,c_white,image_alpha);
