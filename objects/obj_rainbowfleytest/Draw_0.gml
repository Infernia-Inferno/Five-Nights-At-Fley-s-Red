var t = make_color_rgb(r,g,b)draw_sprite_ext(spr_rainbow_fley,0,x,y,1,1,0,t,1);
switch colorpart {
	case 1: g = min(g+15,255);
	if g = 255 colorpart = 2;
	break;
	case 2: r = max(r-15,0);
	if r = 0 colorpart = 3;
	break;
	case 3: b = min(b+15,255);
	if b = 255 colorpart = 4;
	break;
	case 4: g = max(g-15,0);
	if g = 0 colorpart = 5;
	break;
	case 5: r = min(r+15,255);
	if r = 255 colorpart = 6;
	break;
	case 6: b = max(b-15,0);
	if b = 0 colorpart = 1;
	break;
}
show_debug_message(colorpart);
