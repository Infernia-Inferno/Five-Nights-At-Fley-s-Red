// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_savedata(){
	var _savedata = array_create(0);
	var _loadData = 0;
	
	//for every current options, create a struct and add it to the array
	
	var _data = 
	{
		nights : savedata[0],
		skinsunlocked : savedata[1],
		skinsinuse : savedata[2],
	}
	array_push(_savedata, _data);
	
	//convert options array to JSON String (via buffer)
	var _string = json_stringify(_data);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write( _buffer, buffer_string, _string);
	buffer_save( _buffer, "savedata.dat");
	buffer_delete( _buffer );
	
	show_debug_message("Saved " + _string);
}