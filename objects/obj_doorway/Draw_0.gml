draw_sprite(sprite_index,0,x,y);
switch fley_in_door {
	case 1:
	if doorway_num = 1 draw_sprite(spr_fley_door_a,0,x,y);
	else draw_sprite(spr_fley_door_b,0,x,y);
	break;
	case 2:
	if doorway_num = 1 draw_sprite(spr_super_crown_fley_door_a,0,x,y);
	else draw_sprite(spr_super_crown_fley_door_b,0,x,y);
	break;
	case 3:
	draw_sprite(spr_clown_door_b,0,x,y);
	break;
	case 4:
	draw_sprite(spr_astley_door_b,0,x,y);
	break;
	case 6:
	if doorway_num = 1 draw_sprite(spr_fem_door_a,0,x,y);
	else draw_sprite(spr_fem_door_b,0,x,y);
	break;
	
}
var widthdivision = 3;
if doorway_num = 2 widthdivision = 2;
if mouse_x < x + sprite_width/widthdivision && mouse_x > x - sprite_width/widthdivision && mouse_y < y + sprite_height/2.5 && mouse_y > y - sprite_height/2.5 && obj_control.flashlight && !(instance_exists(obj_jumpscares)) && !(game_over) && !(instance_exists(obj_pausescreen)){
	light = max(light-0.15,0);
	if !(shownfley) && !(fley_in_door = 0) {
		audio_play_sound(sfx_windowscare,20,0);
		shownfley = true;
	}
	if fley_in_door = 0 shownfley = false;
} else if !(instance_exists(obj_pausescreen)) && !(game_over) light = min(light+0.1,1);
draw_sprite_ext(sprite_index,0,x,y, 1,1,0,c_black, light);
