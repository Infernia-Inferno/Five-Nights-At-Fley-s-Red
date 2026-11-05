if show_tutorial {
	draw_set_font(fnt_tutorial);
	var str = "Hold S to hide your light";
	switch tutorial_num {
		case 1: str = "Press D to toggle the door"; break;
		case 2: str = "Hold W to shine your light into the hallways"; break;
		case 3: str = "Press Space to open the Camera"; break;
		case 4: str = "Keep the game in the Lounge active"; break;
		case 5: str = "Try not to die"; break;
	}
	draw_set_alpha(tutorial_alpha);
	if tutorial_status = 0 tutorial_alpha=min(tutorial_alpha+0.05,1);
	else if tutorial_status = 1 {
		tutorial_alpha=max(tutorial_alpha-0.05,0);
		if tutorial_alpha = 0 {
			tutorial_status = 0;
			tutorial_num++;
		}
	}
	draw_text(1440/2 - string_width(str)/2,810/2+150,str);
	draw_set_alpha(1);
}
if turbo_power < 26 {
	draw_sprite_ext(spr_warning,1, 1300, 700,1+sin(warning_sin)*0.1,1+sin(warning_sin)*0.1,0,c_white,1);
	timne_until_warning_blare--;
	if timne_until_warning_blare = 0 {
		audio_play_sound(sfx_fnaf_3_alarm,20,0);
		timne_until_warning_blare = 30;
	}
}
