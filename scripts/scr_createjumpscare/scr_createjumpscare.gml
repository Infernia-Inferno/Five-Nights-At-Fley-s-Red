// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createjumpscare(fley){
	if !(instance_exists(obj_jumpscares) || instance_exists(obj_6am) || game_over) {
		var jumpscare = instance_create_layer(x,y,"Jumpscares", obj_jumpscares);
		switch fley {
			case -1: jumpscare.num = 7; break;
			case 0: jumpscare.num = 1; break;
			case 1: jumpscare.num = 3; break;
			case 2: jumpscare.num = 5; break;
			case 3: jumpscare.num = 4; break;
			case 4: jumpscare.num = 10; break;
			case 5: jumpscare.num = 11; break;
		}
	}
}