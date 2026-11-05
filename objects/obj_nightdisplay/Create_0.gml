image_alpha = 0;
var p = 0;
switch night {
	case 1: str = "Night 1"; break;
	case 2: str = "Night 2"; break;
	case 3: str = "Night 3"; break;
	case 4: str = "Night 4"; break;
	case 5: str = "Night 5"; 
	p = true; 
	break;
	case 6: str = "Custom Night"; 
	p = true;
	break;
	case 7: str = "Death Wish"; 
	p = true;
	break;
}
if p audio_play_sound(sfx_phase2,100,0);
else audio_play_sound(sfx_phase1,100,0);
