draw_set_font(fnt_power);
draw_set_color(c_red);
draw_text(25,719, "Caching Graphics");
draw_set_color(c_white);
if drawscreen {
//Large Assets / Misc
for (var i = 0; i < 150; i++) draw_sprite(spr_rickroll,i,0,0);
draw_sprite(spr_camera,1,0,0);
draw_sprite(spr_camera_map,1,0,0);
draw_sprite(spr_camerabutton,1,0,0);
for (var i = 0; i < 10; i++) draw_sprite(spr_static,1,0,0);
draw_sprite(spr_darkness_overlayer,1,0,0);
draw_sprite(spr_door,1,0,0);
draw_sprite(spr_door_gnomed,1,0,0);
draw_sprite(spr_door_windows,1,0,0);
for (var i = 0; i < 17; i++) draw_sprite(spr_explosion,i,0,0);
draw_sprite(spr_fley,1,0,0);
draw_sprite(spr_game_over,1,0,0);
draw_sprite(spr_logo,1,0,0);
draw_sprite(spr_meter_door,1,0,0);
draw_sprite(spr_meter_flashlight,1,0,0);
draw_sprite(spr_ms_paint_fley,1,0,0);
draw_sprite(spr_office,1,0,0);
draw_sprite(spr_pause,1,0,0);
draw_sprite(spr_rainbow_fley,1,0,0);
draw_sprite(spr_storage_desk,1,0,0);
draw_sprite(spr_storage_hall_a_back,1,0,0);
draw_sprite(spr_storage_hall_b_back,1,0,0);
draw_sprite(spr_warning,1,0,0);
//Bootleg
draw_sprite(spr_bootleg_fley_hold,1,0,0);
draw_sprite(spr_bootleg_fley_pizza,1,0,0);
draw_sprite(spr_bootleg_fley_throw,1,0,0);
draw_sprite(spr_sauce,1,0,0);
//Clown
draw_sprite(spr_clown_arcade,1,0,0);
draw_sprite(spr_clown_dining_room,1,0,0);
draw_sprite(spr_clown_door_b,1,0,0);
draw_sprite(spr_clown_hall_b,1,0,0);
//Edgy
draw_sprite(spr_edgy_fley_lounge,1,0,0);
draw_sprite(spr_edgy_fley_room,1,0,0);
draw_sprite(spr_edgy_fley_vent_b,1,0,0);
//Female Fley
draw_sprite(spr_fem_arcade,1,0,0);
draw_sprite(spr_fem_back_room,1,0,0);
draw_sprite(spr_fem_dining_room,1,0,0);
draw_sprite(spr_fem_door_a,1,0,0);
draw_sprite(spr_fem_door_b,1,0,0);
draw_sprite(spr_fem_hall_a,1,0,0);
draw_sprite(spr_fem_hall_b,1,0,0);
draw_sprite(spr_fem_kitchen,1,0,0);
draw_sprite(spr_fem_lounge,1,0,0);
draw_sprite(spr_fem_room,1,0,0);
draw_sprite(spr_fem_vent_a,1,0,0);
draw_sprite(spr_fem_vent_a_2,1,0,0);
draw_sprite(spr_fem_vent_b,1,0,0);
//Fley
draw_sprite(spr_fley_arcade,1,0,0);
draw_sprite(spr_fley_back_room,1,0,0);
draw_sprite(spr_fley_dining_room,1,0,0);
draw_sprite(spr_fley_door_a,1,0,0);
draw_sprite(spr_fley_door_b,1,0,0);
draw_sprite(spr_fley_hall_a,1,0,0);
draw_sprite(spr_fley_hall_b,1,0,0);
draw_sprite(spr_fley_kitchen,1,0,0);
draw_sprite(spr_fley_lounge,1,0,0);
draw_sprite(spr_fley_room,1,0,0);
draw_sprite(spr_fley_vent_a,1,0,0);
draw_sprite(spr_fley_vent_a_2,1,0,0);
draw_sprite(spr_fley_vent_b,1,0,0);
//Camera Locs
draw_sprite(spr_arcade_back,1,0,0);
draw_sprite(spr_arcade_front,1,0,0);
draw_sprite(spr_back_room,1,0,0);
draw_sprite(spr_back_room_back,1,0,0);
draw_sprite(spr_back_room_middle,1,0,0);
draw_sprite(spr_dining_room_back,1,0,0);
draw_sprite(spr_dining_room_front,1,0,0);
draw_sprite(spr_dining_room_middle,1,0,0);
draw_sprite(spr_hallway_a,1,0,0);
draw_sprite(spr_hallway_b,1,0,0);
draw_sprite(spr_kitchen_back,1,0,0);
draw_sprite(spr_kitchen_button,1,0,0);
draw_sprite(spr_kitchen_button2,1,0,0);
draw_sprite(spr_kitchen_fire,1,0,0);
draw_sprite(spr_lounge_back,1,0,0);
draw_sprite(spr_lounge_back_2,1,0,0);
draw_sprite(spr_lounge_front,1,0,0);
draw_sprite(spr_lounge_middle,1,0,0);
draw_sprite(spr_vent_a,1,0,0);
draw_sprite(spr_vent_a_2,1,0,0);
draw_sprite(spr_vent_b,1,0,0);
//Stick Bug
draw_sprite(spr_stick_bug_a1,1,0,0);
draw_sprite(spr_stick_bug_a2,1,0,0);
draw_sprite(spr_stick_bug_jumpscare,1,0,0);
draw_sprite(spr_stick_bug_jumpscare_2,1,0,0);
//Super Crown Fley
draw_sprite(spr_super_crown_fley_arcade,1,0,0);
draw_sprite(spr_super_crown_fley_back_room,1,0,0);
draw_sprite(spr_super_crown_fley_dining_room,1,0,0);
draw_sprite(spr_super_crown_fley_door_a,1,0,0);
draw_sprite(spr_super_crown_fley_door_b,1,0,0);
draw_sprite(spr_super_crown_fley_hall_a,1,0,0);
draw_sprite(spr_super_crown_fley_hall_b,1,0,0);
draw_sprite(spr_super_crown_fley_kitchen,1,0,0);
draw_sprite(spr_super_crown_fley_lounge,1,0,0);
draw_sprite(spr_super_crown_fley_room,1,0,0);
//Turbo Fley
draw_sprite(spr_turbo_1,1,0,0);
draw_sprite(spr_turbo_2,1,0,0);
draw_sprite(spr_turbo_chair,1,0,0);
draw_sprite(spr_turbo_power,1,0,0);
//Menu Sprites
draw_sprite(spr_astley_menu,1,0,0);
draw_sprite(spr_clown_menu,1,0,0);
draw_sprite(spr_doobie_menu,1,0,0);
draw_sprite(spr_edgy_menu,1,0,0);
draw_sprite(spr_ette_menu,1,0,0);
draw_sprite(spr_fley_menu,1,0,0);
draw_sprite(spr_gnome_menu,1,0,0);
draw_sprite(spr_monika_menu,1,0,0);
draw_sprite(spr_paint_menu,1,0,0);
draw_sprite(spr_peanut_menu,1,0,0);
draw_sprite(spr_plush_menu,1,0,0);
draw_sprite(spr_prismatic_menu,1,0,0);
draw_sprite(spr_statue_menu,1,0,0);
draw_sprite(spr_stick_menu,1,0,0);
draw_sprite(spr_turbo_menu,1,0,0);
draw_sprite(spr_witch_menu,1,0,0);
draw_sprite(spr_woman_menu,1,0,0);
draw_sprite(spr_yandare_menu,1,0,0);
//Plush
draw_sprite(spr_plush_fley,1,0,0);
draw_sprite(spr_plush_fley_gooned,1,0,0);
draw_sprite(spr_plush_fley_grenade,1,0,0);
draw_sprite(spr_plush_fley_gun,1,0,0);
//"Jumpscares"
draw_sprite(spr_clown_jumpscare_arm,1,0,0);
draw_sprite(spr_clown_jumpscare_body,1,0,0);
draw_sprite(spr_clown_jumpscare_head,1,0,0);
draw_sprite(spr_edgy_jumpscare,1,0,0);
draw_sprite(spr_edgy_jumpscare_back,1,0,0);
draw_sprite(spr_edgy_jumpscare_hand,1,0,0);
draw_sprite(spr_fem_jumpscare_head,1,0,0);
draw_sprite(spr_fem_jumpscare_body,1,0,0);
draw_sprite(spr_fem_jumpscare_arm,1,0,0);
draw_sprite(spr_fley_astley_jumpscare,1,0,0);
draw_sprite(spr_fley_astley_jumpscare_2,1,0,0);
draw_sprite(spr_fley_jumpscare_head,1,0,0);
draw_sprite(spr_fley_jumpscare_body,1,0,0);
draw_sprite(spr_fley_jumpscare_arm,1,0,0);
draw_sprite(spr_monika_jumpscare,1,0,0);
draw_sprite(spr_plush_fley_jumpscare,1,0,0);
draw_sprite(spr_super_crown_jumpscare_arm,1,0,0);
draw_sprite(spr_super_crown_jumpscare_body,1,0,0);
draw_sprite(spr_super_crown_jumpscare_crown,1,0,0);
draw_sprite(spr_super_crown_jumpscare_hair,1,0,0);
draw_sprite(spr_super_crown_jumpscare_head,1,0,0);
draw_sprite(spr_turbo_fley_jumpscare,1,0,0);
draw_sprite(spr_turbo_fley_jumpscare_head,1,0,0);
draw_sprite(spr_yandare_jumpscare,1,0,0);
//Statue
draw_sprite(spr_peanut_fley,1,0,0);
draw_sprite(spr_statue_fley,1,0,0);
//Yandare
draw_sprite(spr_monika_fley_active,1,0,0);
draw_sprite(spr_monika_fley_cam,1,0,0);
draw_sprite(spr_monika_fley_disabled,1,0,0);
draw_sprite(spr_yandare_fley_active,1,0,0);
draw_sprite(spr_yandare_fley_cam,1,0,0);
draw_sprite(spr_yandare_fley_disabled,1,0,0);
//Descs
draw_sprite(spr_desc_astley,1,0,0);
draw_sprite(spr_desc_clown,1,0,0);
draw_sprite(spr_desc_edgy,1,0,0);
draw_sprite(spr_desc_ette,1,0,0);
draw_sprite(spr_desc_fley,1,0,0);
draw_sprite(spr_desc_paint,1,0,0);
draw_sprite(spr_desc_plush,1,0,0);
draw_sprite(spr_desc_statue,1,0,0);
draw_sprite(spr_desc_stick,1,0,0);
draw_sprite(spr_desc_turbo,1,0,0);
draw_sprite(spr_desc_yand,1,0,0);
//Misc
draw_sprite(spr_astley_door_b,1,0,0);
draw_sprite(spr_custom_night_plus,1,0,0);
draw_sprite(spr_custom_night_minus,1,0,0);

globalvar customnightais;
for (var p = 0; p < 11; p++) {
	customnightais[p] = 0;
}

globalvar savedata;
savedata[0] = 0; //Night Unlocks, 0 is no nights beaten, 5 is night 5 cleared, Custom night and Death wish are unlocked at 5, 6 is death wish beaten
savedata[1] = { //Options
	sound : 100,
	music : 100,
};
savedata[2] = { //Skins in use
	female : false,
	monika : false,
	peanut : false,
};

globalvar night;
night = 0;
if (file_exists("savedata.dat")) {
	var _buffer = buffer_load( "savedata.dat" );
	var _string = buffer_read( _buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);

	show_debug_message(_loadData)
		
	//_loadData = array_pop(_loadData);

	savedata[0] = _loadData.nights;
	savedata[1] = _loadData.skinsunlocked;
	savedata[2] = _loadData.skinsinuse;
	savedata[0] = savedata[0];
	savedata[1] = savedata[1];
	savedata[2] = savedata[2];
}
room_goto(rm_menu);
}
drawscreen = 1;
