var camx = camera_get_view_x(view_camera[0]) * 0.3;
var camy = camera_get_view_y(view_camera[0]) * 0.3;
draw_sprite(spr_storage_desk, 1, x+camx, y+camy);
draw_set_font(fnt_clock);
var hourdraw = 12;
var adjustmentx = 0;
if !(hour = 0) {
	hourdraw = hour;
	adjustmentx = 40;
}
hourdraw = string_insert(hourdraw,":00",1);
draw_text(x+90+camx+adjustmentx,y+15+camy, hourdraw);
if !(noplush) {
	draw_sprite_ext(plush_fley_sprite, 1, x+camx+390, y+camy+180, squishx+squishysin*bouncefactor*-0.25, squishy+squishysin*bouncefactor*0.25, 0, c_white, 1);
	gpu_set_fog(1, c_white, 0, 99);
	draw_sprite_ext(plush_fley_sprite, 1, x+camx+390, y+camy+180, squishx+squishysin*bouncefactor*-0.25, squishy+squishysin*bouncefactor*0.25, 0, c_white, plushfleyglow);
}
gpu_set_fog(0, c_white, 0, 99);
