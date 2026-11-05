if startroom = -1 {
	startroom = myroom;
	if ai_type = 2 startroom = 1;
}
if instance_exists(obj_jumpscares) || instance_exists(obj_6am) || game_over instance_destroy(self);
var pause = false
if instance_exists(obj_fadein) pause = true;
if instance_exists(obj_pausescreen) pause = true;

if (ai_type = 1 || ai_type = 3) && !(clown_activate = 0) && !(pause){
	//CLOWN ACTIVATE
	clown_activate = max(0,clown_activate-1);
} else if !(pause) try_move_delay--;
function addtemproom(temproom) {
	tempwhitelist_rooms[array_length(tempwhitelist_rooms)] = temproom;
}
for (var u = array_length(tempwhitelist_rooms); u >= 0; u--;) {
	array_delete(tempwhitelist_rooms,u,1);
}

if try_move_delay <= 0 {
	if (random_range(1,25) <= ai_level) || myroom = 13 || myroom = 12 {
		//AI Level Success
		//Determine Rooms that AI can move into
		switch myroom {
			case 1: //Hall A
				if ai_type = 2 addtemproom(7);
				else {
					if whitelist_rooms[2] addtemproom(2);
					if whitelist_rooms[7] addtemproom(7);
					if whitelist_rooms[11] && doorwaya.fley_in_door = 0 {
						addtemproom(11);
						addtemproom(11);
						addtemproom(11);
					}
				}
			break;
			case 2: //Hall B
				switch ai_type {
				case 1:
				case 2: 
					if doorwayb.fley_in_door = 0 addtemproom(12);
				break;
				case 0:
					if whitelist_rooms[1] addtemproom(1);
					if whitelist_rooms[3] addtemproom(7);
					if whitelist_rooms[12] && doorwayb.fley_in_door = 0 {
						addtemproom(12);
						addtemproom(12);
						addtemproom(12);
					}
				break;
				}
			break;
			case 3: //Arcade
			switch ai_type {
				case 1:
				case 2:
					 addtemproom(2);
				break;
				case 0:
					if whitelist_rooms[2] addtemproom(2);
					if whitelist_rooms[4] addtemproom(4);
					if whitelist_rooms[8] addtemproom(8);
				break;
			}
			break;
			case 4: //Dining Room
			switch ai_type {
				case 1:
				case 2:
					 addtemproom(3);
				break;
				case 0:
					if whitelist_rooms[3] addtemproom(3);
					if whitelist_rooms[5] addtemproom(5);
				break;
			}
			break;
			case 5: //Kitchen
				if ai_type = 2 {
					addtemproom(4);
				} else {
					if whitelist_rooms[4] addtemproom(4);
					if whitelist_rooms[6] addtemproom(6);
				}
			break;
			case 6: //Back Room
				if ai_type = 2 {
					addtemproom(5);
				} else {
					if whitelist_rooms[5] addtemproom(5);
					if whitelist_rooms[7] addtemproom(7);
				}
			break;
			case 7: //Lounge
				switch ai_type {
					case 3: addtemproom(10); break;
					case 2: addtemproom(6); break;
					case 1:
					case 0:
					if whitelist_rooms[1] addtemproom(1);
					if whitelist_rooms[6] addtemproom(6);
					if whitelist_rooms[9] addtemproom(9);
					if whitelist_rooms[10] addtemproom(10);
					break;
				}
			break;
			case 8: //Vent A-1
				if whitelist_rooms[3] addtemproom(3);
				if whitelist_rooms[9] addtemproom(9);
			break;
			case 9: //Vent A-2
				if whitelist_rooms[7] addtemproom(7);
				if whitelist_rooms[8] addtemproom(8);
			break;
			case 10: //Vent B
				if ai_type = 3 addtemproom(13);
				else {
					if whitelist_rooms[7] addtemproom(7);
					if whitelist_rooms[13] addtemproom(13);
				}
			break;
			case 11: //Hall A Door
				if whitelist_rooms[13] addtemproom(13);
				else if whitelist_rooms[startroom] addtemproom(startroom);
			break;
			case 12: //Hall B Door
				if !(obj_door.open) || testmode {
					addtemproom(startroom);
					obj_control.door_health-=random_range(50,80);
					audio_play_sound(sfx_door_hit, 10, 0);
					obj_door.hurtanim = 20;
					if obj_control.door_health <= 0 {
						obj_door.destroy = true;
						obj_door.yv = -20;
						obj_door.xv = -10;
						obj_door.open = false;
					}
				} else {
					createjumpscare(fley);
				}
			break;
			case 13: //Room (Post Vent B or Door A)
				if instance_exists(inroomobject) {
					instance_destroy(inroomobject);
					instance_create_layer(0,0, "Fadeout", obj_statue_dissapear);
				}
				if obj_control.exposure < 20-(ai_level/4) || testmode {
					addtemproom(startroom);
					if ai_type = 3 clown_activate = random_range(1200,1920) - ai_level*60;
				} else {
					var a = instance_create_layer(x,y,"Room_Wall",obj_jumpscaredelay);
					a.fley = fley;
					a.delay = random_range(30, 120);
					addtemproom(69);
				}
			break;
		}
		//Determine which room to move to
		show_debug_message(tempwhitelist_rooms);
		show_debug_message(myroom);
		if myroom = 11 doorwaya.fley_in_door = 0;
		if myroom = 12 doorwayb.fley_in_door = 0;
		if array_length(tempwhitelist_rooms) > 0 myroom = tempwhitelist_rooms[random_range(0, array_length(tempwhitelist_rooms)-1)];
		switch myroom {
			case 11: doorwaya.fley_in_door = fley+1; break;
			case 12: doorwayb.fley_in_door = fley+1; break;
			case 13: inroomobject = instance_create_layer(736,928,"Instances", obj_inroom); 
			var p = spr_fley_room;
			switch fley {
				case 0: p = spr_fley_room; break;
				case 1: p = spr_super_crown_fley_room; break;
				case 4: p = spr_edgy_fley_room; break;
				case 5: p = spr_fem_room;
			}
			inroomobject.sprite_index = p;
			break;
		}
		//Laugh if clown
		if ai_type = 1 {
			if myroom = 4 {
				obj_control.door_health-=270;
				clown_activate = random_range(960,1740) - ai_level*60;
				if obj_control.door_health <= 0 {
					obj_door.destroy = true;
					obj_door.yv = -20;
					obj_door.xv = -10;
					obj_door.open = false;
				}
			} else audio_play_sound(sfx_ronald_laugh, 2, 0);
		}
	} else show_debug_message("FAILED");
	try_move_delay = 60*try_move*(5+chaos_modifier)/5;
	if myroom = 13 || myroom = 12 try_move_delay*=1.5;
	if random_range(1,100) <= chaos_chance {
		chaos_modifier-= random_range(-1,1) * chaos_level;
		chaos_modifier = clamp(chaos_modifier, -0.8, 0.5);
	}
}
