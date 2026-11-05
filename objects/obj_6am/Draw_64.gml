draw_set_color(c_black);
a = min(a+0.06,1);
draw_set_alpha(a);
draw_rectangle(0,0,room_width,room_height, false);
draw_set_alpha(1);
draw_set_color(c_white);
str = "6:00";
if stralphafadeleft = 180 && a = 1 image_alpha = min(1,image_alpha + 0.06);
if image_alpha = 1 || !(stralphafadeleft = 180) {
	stralphafadeleft = max(0,stralphafadeleft-1);
	if stralphafadeleft = 0 image_alpha = max(0,image_alpha - 0.06);
	if image_alpha = 0 room_goto(rm_menu);
}
draw_set_alpha(image_alpha);
draw_set_font(fnt_clock);
draw_text(720-string_width(str)/2-20, 375, str);
draw_set_alpha(1);
