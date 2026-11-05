draw_sprite_ext(doorsprite,1,x+random_range(hurtanim*-1,hurtanim),y+random_range(hurtanim*-1,hurtanim),1,1,rot,c_white,1);
hurtanim = max(hurtanim-1,0);
gpu_set_fog(1,c_white,1,1);
draw_sprite_ext(doorsprite,0,x,y,1,1,rot,c_white,abs(sin(glowvar)*0.5));
gpu_set_fog(0,c_white,1,1);
