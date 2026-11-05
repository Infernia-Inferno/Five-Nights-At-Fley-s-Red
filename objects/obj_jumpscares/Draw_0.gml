//IF AN INSTANCE OF THIS OBJECT EXISTS, THE GAME IS OVER. GAMEPLAY STOPS AND THE JUMPSCARE WILL PLAY OUT UNTIL DEATH OCCURS.
if start = false {	switch num {
		case 0:
			//Plush Fley - Gun
			x = room_width/2;
			y = room_height;
			sprite_index = spr_plush_fley_jumpscare;
			yv = -20;
			audio_play_sound(sfx_hooh,10,0);
		break;
		case 1: case 11:
			//Fley
			x = room_width/2;
			y = room_height+600;
			yv = -30;
			vibe_check = 0;
			hand_y = 150;
			hand_yv = -16;
			hand_rot = 0;
			headoffset = -10;
			audio_play_sound(sfx_mario_hello,10,0);
			sound = false;
		break;
		case 2:
			//Turbo Fley
			x = room_width/2;
			y = room_height+700;
			yv = -30;
			time_until_death = 60;
			audio_play_sound(sfx_triggered,10,0);
		break;
		case 3:
			//Super Crown Fley
			x = room_width/2;
			y = room_height+700;
			yv = -30;
			headrot = 20;
			time_until_death = 40;
			audio_play_sound(sfx_empress,10,0);
		break;
		case 4:
			//Fley Astley
			x = room_width/2;
			y = room_height+600;
			yv = -30;
			time_until_death = 78;
			gun_y = 120;
			audio_play_sound(sfx_say_goodbye,10,0);
		break;
		case 5:
			//Statue Fley
			audio_stop_all();
			audio_play_sound(sfx_173_kill,10,0);
			time_until_death = 80;
			obj_control.drawhuds = false;
		break;
		case 6:
			//Clown
			x = room_width/2;
			y = room_height+800;
			yv = -30;
			headrot = 20;
			time_until_death = 21;
			audio_play_sound(sfx_ronald_laugh,10,0);
		break;
		case 7:
			//Ms Paint Fley
			x = 1981;
			y = 745;
			if !(obj_door.open) {
				obj_door.destroy = true;
				obj_door.yv = -30;
				obj_door.xv = -20;
				audio_play_sound(sfx_desk_slam_2,10,0);
			}
			rushE = 60;
			accelerant = 1;
			rot = 0;
			xscale = 1;
			yscale = 1;
		break;
		case 8: case 9:
			//Yandare
			x = room_width/2;
			y = room_height+540;
			yv = -30;
			time_until_death = 70;
			audio_play_sound(sfx_empress,10,0);
		break;
		case 10:
			//Edgy
			x = room_width/2;
			y = room_height+600;
			yv = -30;
			headrot = 100;
			audio_play_sound(sfx_scp_horror_9,10,0);
		break;
	}
	start = true;
}
//Calculations
if !(game_over) switch num {
	case 0:
		//Plush Fley - Gun
		y+=yv*3;
		yv++;
		if yv = 5 game_over = true;
	break;
	case 1: case 11:
		//Fley
		y+=yv*1.5;
		hand_yv+=0.5;
		if !(yv = 0) {
			yv++;
			headoffset = max(headoffset-1,0);
		}
		hand_y+=hand_yv;
		hand_rot+=hand_yv/14;
		if hand_yv = 0 {
			hand_yv = -0.5;
			vibe_check+=0.5;
			hand_rot-=0.4;
			obj_control.screenshake = 4;
			if vibe_check = 22 game_over = true;
			if sound = false {
				audio_play_sound(sfx_triggered,10,0);
				sound = true;
			}
		}
	break;
	case 2:
		//Turbo Fley
		y+=yv*1.5;
		if !(yv = 0) yv++;
		time_until_death--;
		obj_control.screenshake += 2.5;
		if time_until_death = 0 game_over = true;
	break;
	case 3:
		//Super Crown Fley
		y+=yv*1.8;
		headrot/=1.1;
		if headrot < 0 headrot = 0;
		if !(yv = 0) yv++;
		if floor(headrot) = 0 time_until_death--;
		if time_until_death = 0 game_over = true;
	break;
	case 4:
		//Fley Astley
		y+=yv*2;
		if !(yv = 0) yv++;
		gun_y = gun_y/1.1;
		time_until_death--;
		if time_until_death = 0 game_over = true;
	break;
	case 5:
		//Statue
		time_until_death--;
		if time_until_death = 0 game_over = true;
	break;
	case 6:
		//Clown
		y+=yv*1.8;
		headrot/=1.1;
		if headrot < 0 headrot = 0;
		if !(yv = 0) yv++;
		obj_control.screenshake+=2;
		if floor(headrot) = 0 time_until_death--;
		if time_until_death = 0 game_over = true;
	break;
	case 7:
		//Paint
		rushE = max(rushE-1,0);
		if rushE = 0 {
			accelerant+=0.5;
			obj_control.screenshake+=3;
			rot = random_range(-5,5);
			xscale = random_range(0.9,1.1);
			yscale = random_range(0.9,1.1);
				var r = round(random_range(1,5));
				switch r {
					case 1: audio_play_sound(sfx_table_slap1,1,0); break;
					case 2: audio_play_sound(sfx_table_slap2,1,0); break;
					case 3: audio_play_sound(sfx_table_slap3,1,0); break;
					case 4: audio_play_sound(sfx_table_slap4,1,0); break;
					case 5: audio_play_sound(sfx_table_slap5,1,0); break;
				}
			if accelerant = 5 game_over = true;
		}
	break;
	case 8: case 9:
		//Yandare
		y+=yv*1.8;
		if !(yv = 0) yv++;
		time_until_death--;
		if time_until_death = 0 game_over = true;
	break;
	case 10:
		//Edgy
		y+=yv*1.8;
		headrot/=1.1;
		if headrot < 0 headrot = 0;
		if !(yv = 0) yv++;
		if floor(headrot) = 0 game_over = true;
	break;
}
//Draw
switch num {
	case 0:
		draw_self(); //Plush Fley - Gun
	break;
	case 1:
		//Fley
		draw_sprite(spr_fley_jumpscare_body,0,x,y);
		draw_sprite(spr_fley_jumpscare_head,0,x,y-650+headoffset);
		draw_sprite_ext(spr_fley_jumpscare_arm,0,x-320,y+hand_y+vibe_check*16,1+vibe_check/20,1+vibe_check/20,hand_rot,c_white,1);
		draw_sprite_ext(spr_fley_jumpscare_arm,0,x+320,y+hand_y+vibe_check*16,-1-vibe_check/20,1+vibe_check/20,-hand_rot,c_white,1);
	break;
	case 2:
		//Turbo Fley
		draw_sprite(spr_turbo_fley_jumpscare,0,x,y);
		draw_sprite(spr_turbo_fley_jumpscare_head,0,x+random_range(-5,5),y-650+random_range(-5,5));
	break;
	case 3:
		//Super Crown Fley
		draw_sprite_ext(spr_super_crown_jumpscare_hair,0,x,y-450,1,1,0,c_white,1);
		draw_sprite_ext(spr_super_crown_jumpscare_arm,0,x-70,y-400,1,1,headrot,c_white,1);
		draw_sprite(spr_super_crown_jumpscare_body,0,x,y);
		draw_sprite_ext(spr_super_crown_jumpscare_head,0,x,y-450,1,1,headrot,c_white,1);
		draw_sprite(spr_super_crown_jumpscare_crown,0,x-400-headrot*5,y-480+headrot*4);
	break;
	case 4:
		//Fley Astley
		draw_sprite(spr_fley_astley_jumpscare,0,x,y);
		draw_sprite(spr_fley_astley_jumpscare_2,0,x-40,y+gun_y);
	break;
	case 5:
		//Statue Fley
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height, false);
		draw_set_color(c_white);
	break;
	case 6:
		//Clown
		if !(game_over) {
			clownrandom1 = random_range(-5,5);
			clownrandom2 = random_range(-5,5);
			clownrandom3 = random_range(-5,5);
			clownrandom4 = random_range(-5,5);
			clownrandom5 = random_range(0.9,1.1)
		}
		draw_sprite_ext(spr_clown_jumpscare_arm,0,x-90+clownrandom1,y-400+clownrandom2,1,1,headrot*2.2,c_white,1);
		draw_sprite(spr_clown_jumpscare_body,0,x,y);
		draw_sprite_ext(spr_clown_jumpscare_head,0,x+clownrandom3,y-500+clownrandom4,1, clownrandom5,headrot*1.2,c_white,1);
	break;
	case 7:
		draw_sprite_ext(spr_ms_paint_fley,0,x,y,accelerant*xscale,accelerant*yscale,rot,c_white,1);
	break;
	case 8: 
		//Yandare
		draw_sprite(spr_yandare_jumpscare,0,x,y);
	break;
	case 9:
		//Monika
		draw_sprite(spr_monika_jumpscare,0,x,y);
	break;
	case 10:
		//Edgy
		draw_sprite(spr_edgy_jumpscare_back,0,x,y);
		draw_sprite_ext(spr_edgy_jumpscare_hand,0,x-70,y,1,1,headrot,c_white,1);
		draw_sprite(spr_edgy_jumpscare,0,x,y);
	break;
	case 11:
		//Fem Fley
		draw_sprite(spr_fem_jumpscare_body,0,x,y);
		draw_sprite(spr_fem_jumpscare_head,0,x,y-650+headoffset);
		draw_sprite_ext(spr_fem_jumpscare_arm,0,x-320,y+hand_y+vibe_check*16,1+vibe_check/20,1+vibe_check/20,hand_rot,c_white,1);
		draw_sprite_ext(spr_fem_jumpscare_arm,0,x+320,y+hand_y+vibe_check*16,-1-vibe_check/20,1+vibe_check/20,-hand_rot,c_white,1);
	break;
}
