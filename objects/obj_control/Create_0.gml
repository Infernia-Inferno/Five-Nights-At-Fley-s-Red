randomize();
function createai(fleyval, aitype, myroom, movedelay, ai_level, chaos_level, chaos_chance, chaos_modifier, roomswhitelisted) {
	var ai = instance_create_layer(x,y,"Instances", obj_ai);
	ai.myroom = myroom;
	ai.ai_level = ai_level;
	ai.chaos_level = chaos_level;
	ai.chaos_chance = chaos_chance;
	ai.chaos_modifier = chaos_modifier;
	ai.try_move = movedelay;
	ai.whitelist_rooms[1] = roomswhitelisted.halla;
	ai.whitelist_rooms[2] = roomswhitelisted.hallb;
	ai.whitelist_rooms[3] = roomswhitelisted.arcade;
	ai.whitelist_rooms[4] = roomswhitelisted.diningroom;
	ai.whitelist_rooms[5] = roomswhitelisted.kitchen;
	ai.whitelist_rooms[6] = roomswhitelisted.backroom;
	ai.whitelist_rooms[7] = roomswhitelisted.lounge;
	ai.whitelist_rooms[8] = roomswhitelisted.venta1;
	ai.whitelist_rooms[9] = roomswhitelisted.venta2;
	ai.whitelist_rooms[10] = roomswhitelisted.ventb;
	ai.whitelist_rooms[11] = roomswhitelisted.doora;
	ai.whitelist_rooms[12] = roomswhitelisted.doorb;
	ai.whitelist_rooms[13] = roomswhitelisted.inroom;
	ai.ai_type = aitype;
	ai.fley = fleyval;
	return(ai);
}
var allrooms =
{
	halla : true,
	hallb : true,
	arcade : true,
	diningroom : true,
	kitchen : true,
	backroom : true,
	lounge : true,
	venta1 : true,
	venta2 : true,
	ventb : true,
	doora : true,
	doorb : true,
	inroom : true
};
var novents =
{
	halla : true,
	hallb : true,
	arcade : true,
	diningroom : true,
	kitchen : true,
	backroom : true,
	lounge : true,
	venta1 : false,
	venta2 : false,
	ventb : false,
	doora : true,
	doorb : true,
	inroom : true
};


var fleyai = 11;
var scrownai = 10;
var clownai = 9;
var astleyai = 9;
var edgyai = 9;
var paintai = 10;
var turboai = 12;
var statueai = 10;
var plushai = 13;
var stickbugai = 14;
var yandareai = 13;

switch night {
	case 1:
		//Night 1
		fleyai = 3;
		scrownai = 4;
		clownai = 0;
		astleyai = 5;
		paintai = 0;
		turboai = 5;
		statueai = 3;
		plushai = 5;
		stickbugai = 6;
		yandareai = 0;
		edgyai = 6;
	break;
	case 2:
		//Night 2
		fleyai = 6;
		scrownai = 5;
		clownai = 4;
		astleyai = 7;
		paintai = 4;
		turboai = 6;
		statueai = 4;
		plushai = 7;
		stickbugai = 8;
		yandareai = 7;
		edgyai = 9;
	break;
	case 3:
		//Night 3
		fleyai = 8;
		scrownai = 7;
		clownai = 6;
		astleyai = 9;
		paintai = 6;
		turboai = 8;
		statueai = 5;
		plushai = 9;
		stickbugai = 10;
		yandareai = 9;
		edgyai = 12;
	break;
	case 4:
		//Night 4
		fleyai = 11;
		scrownai = 10;
		clownai = 10;
		astleyai = 12;
		paintai = 10;
		turboai = 11;
		statueai = 7;
		plushai = 10;
		stickbugai = 12;
		yandareai = 11;
		edgyai = 16;
	break;
	case 5:
		//Night 5
		fleyai = 13;
		scrownai = 13;
		clownai = 12;
		astleyai = 15;
		paintai = 17;
		turboai = 15;
		statueai = 11;
		plushai = 17;
		stickbugai = 18;
		yandareai = 16;
		edgyai = 18;
	break;
	case 6:
		//Custom Night
		fleyai = customnightais[0];
		scrownai = customnightais[1];
		turboai = customnightais[2];
		statueai = customnightais[3];
		stickbugai = customnightais[4];
		paintai = customnightais[5];
		astleyai = customnightais[6];
		plushai = customnightais[7];
		clownai = customnightais[8];
		yandareai = customnightais[9];
		edgyai = customnightais[10];
	break;
	case 7:
		//Death Wish
		death_wish = true;
		
		fleyai = 18;
		scrownai = 20;
		clownai = 15;
		astleyai = 21;
		paintai = 12;
		turboai = 18;
		statueai = 15;
		plushai = 20;
		stickbugai = 22;
		yandareai = 20;
		edgyai = 20;
	break;
}
var fval = 0;
if savedata[2].female = true fval = 5;
fley = createai(fval, 0, 7,6.9,fleyai,0.22,20,0, allrooms);
s_crown_fley = createai(1, 0, 3, 5.4,scrownai,0.06,7,0, novents);
clown = createai(2, 1, 4, 7.5,clownai,0.1,15,0, allrooms);
astley = createai(3, 2, 5,7,astleyai,0.09,30,0, allrooms);
edgy = createai(4, 3, 7,6.1,edgyai,0,0,0, allrooms);
paint = instance_create_layer(x,y,"Instances", obj_paint_fley_ai);
paint.ai = paintai;
turbo_ai = turboai;
statue = statueai;
obj_desk.plush_ai = plushai;
stick_bug_ai = stickbugai;
yandare_ai = yandareai;

stick_bug_timer = 160*60 - stick_bug_ai*random_range(3,5)*60;
yandare_timer = 140*60 - yandare_ai*random_range(3,5)*60;

//paintdashframe = 0; //Separated into 90
audio_play_sound(mus_a_hat_in_time_vanessa_wants_to_play,100,1);
globalvar game_over;
game_over = false;
darksurf = noone;

globalvar testmode;
testmode = false;

chairsprite = spr_turbo_1;
time_until_imminent_destruction = random_range(32,1569);

if night = 1 show_tutorial = true;
tutorial_alpha = 0;
tutorial_status = 0;
tutorial_num = 0;
tutorial_end = 120;
timne_until_warning_blare = 30;
