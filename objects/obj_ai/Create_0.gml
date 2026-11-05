for (var i = 0; i > 12; i++) whitelist_rooms[i] = false; //Translates to one less than Cam room, moves that the character can move into
tempwhitelist_rooms[0] = 0; //Resets every frame, a character will use this list to determine which rooms they can move that attempt.
//Try move is time between movement attempts, try move delay is the frames between the next attempt.

//AI level is a range between 0 and 25, 0 is no AI, 25 is guaranteed movement every try move. 20 is 80% chance, etc.

//Chaos chance is the chance to add the chaos level (divided by 10) to the chaos modifier.
//The Try move is multiplied by the chaos modifier
//path_type is the route the AI takes

roomaggromultiplier[1] = 0.9;
roomaggromultiplier[2] = 0.8;
roomaggromultiplier[3] = 0;
roomaggromultiplier[4] = -0.5;
roomaggromultiplier[5] = -1;
roomaggromultiplier[6] = -0.5;
roomaggromultiplier[7] = 0;
roomaggromultiplier[8] = 0.6;
roomaggromultiplier[9] = 0.7;
roomaggromultiplier[10] = 0.9;
roomaggromultiplier[11] = 1;
roomaggromultiplier[12] = 1;
roomaggromultiplier[13] = 1;


//Rooms:
//0 - No Longer Real
//1 - Hall A
//2 - Hall B
//3 - Arcade
//4 - Dining Room
//5 - Kitchen
//6 - Back Room
//7 - Lounge
//8 - Vent A-1
//9 - Vent A-2
//10 - Vent B
//11 - Hall A Door
//12 - Hall B Door
//13 - Room (Typically used for vent B)

clown_activate = random_range(960,1740) - ai_level*60;
try_move_delay = 60*try_move;
inroomobject = NaN;

//AI Types:
//0: Normal
//1: Clown: Only starts moving after "Clown_Activate" reaches 0 (Timer is range between 16 - 29s normally, -1s per ai level), beelines for player afterwards
//2: Fley Astley: Obscures cams, wanders around in a loop, checking your door B when they're near it
//3: Edgy Fley: Starts in lounge, goes through vent B to get to your room

//Fley Vals
//0: Fley
//1: Super Crown
//2: Clown
//3: Astley
//4: Edgy
