//use to control the size of the player in each room

switch (room)
{
	case House: target_size = 128; break;
	case Street: target_size = 64; break;
	case Casino: target_size = 192; break;
	default: target_size = 64; break;
}

//walking speed grows with the player's size 


//House 8, Street 4, Casino 12
move_speed = target_size / 16

//start facing down, standing still
sprite_index = PlayerSprite_Down
image_index = 0
image_speed = 0
walk_anim_speed = 0.4


//Only the player's feet cllide, so its head can overlap a wall's top edge
is_blocked = function(_nx, _ny){
	var _hw = target_size * 0.2 
	var _fh = target_size * 0.12
	var _x1 = _nx - _hw, _x2 = _nx + _hw
	var _y1 = _ny - _fh, _y2 = _ny - 1;
    return collision_rectangle(_x1, _y1, _x2, _y2, Obj_Walls, true, true) != noone
    || collision_rectangle(_x1, _y1, _x2, _y2, Obj_Lock,  true, true) != noone
	|| collision_rectangle(_x1, _y1, _x2, _y2, Obj_Solid, false, true) != noone;
}

//If we came through a door, appear at that door's spawn point
if (variable_global_exists("spawn_x")&& global.spawn_x != undefined){
	x = global.spawn_x 
	y = global.spawn_y
	//only use it once
	global.spawn_x = undefined
}
near_door = noone
