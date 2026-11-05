draw_set_alpha(0.5);
var c = make_color_rgb(200+sin(sinthing)*35,0,0);
draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c,c,false);
draw_set_alpha(1);
if alphastate alpha = (alpha+0.5)/2;
else alpha = (alpha+1)/2;
draw_sprite_ext(spr_logo,1,x,y+sin(sinthing)*15, 0.75, 0.75, sin(sinthing*0.5), c_white, alpha);
sinthing+=0.05;

var fleymenu = instance_create_layer(random_range(0,room_width),room_height,"MenuFleys",obj_menufley);
fleymenu.yv = random_range(-10,-40);
fleymenu.xv = random_range(-40,40);
