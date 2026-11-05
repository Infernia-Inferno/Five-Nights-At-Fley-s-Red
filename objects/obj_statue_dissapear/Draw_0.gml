draw_set_alpha(image_alpha);
draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1);
image_alpha-=0.1;
if image_alpha = 0 instance_destroy(self);
