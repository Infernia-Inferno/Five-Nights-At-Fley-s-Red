audio_play_sound(sfx_scp_horror_9,7,0);
if random_range(0,1) >= 0.5 image_xscale = 1;
else image_xscale = -1;
obj_control.screenshake+=100;

if savedata[2].peanut sprite_index = spr_peanut_fley;
