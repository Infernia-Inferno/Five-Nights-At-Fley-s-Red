audio_stop_all();
audio_play_sound(sfx_6_am,100,0);
image_alpha = 0;
a = 0;
switch night {
	case 1: case 2: case 3: case 4: case 5: if savedata[0] < night savedata[0] = night; break;
	case 6: savedata[0] = 5; break;
	case 7: savedata[0] = 6; break;
}
scr_savedata();
