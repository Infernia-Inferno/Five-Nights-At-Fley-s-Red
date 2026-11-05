switch round(random_range(1,18)) {
	case 1: sprite_index = spr_astley_menu; break;
	case 2: sprite_index = spr_clown_menu; break;
	case 3: sprite_index = spr_doobie_menu; break;
	case 4: sprite_index = spr_edgy_menu; break;
	case 5: sprite_index = spr_ette_menu; break;
	case 6: sprite_index = spr_fley_menu; break;
	case 7: sprite_index = spr_gnome_menu; break;
	case 8: sprite_index = spr_monika_menu; break;
	case 9: sprite_index = spr_peanut_menu; break;
	case 10: sprite_index = spr_prismatic_menu; break;
	case 11: sprite_index = spr_statue_menu; break;
	case 12: sprite_index = spr_stick_menu; break;
	case 13: sprite_index = spr_turbo_menu; break;
	case 14: sprite_index = spr_witch_menu; break;
	case 15: sprite_index = spr_woman_menu; break;
	case 16: sprite_index = spr_yandare_menu; break;
	case 17: sprite_index = spr_paint_menu; break;
	case 18: sprite_index = spr_plush_menu; break;
}
image_xscale = random_range(0.2,1);
image_yscale = image_xscale;
if round(random_range(0,1)) image_xscale*=-1;
