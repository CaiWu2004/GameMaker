var _right = keyboard_check(ord("D"))
var _left = keyboard_check(ord("A"))
var _down = keyboard_check(ord("S"))
var _up = keyboard_check(ord("W"))


//-1 left, 0 none, 1 right
var _dx = _right - _left
//-1 up, 0 none, 1 down
var _dy = _down - _up

if (_dx != 0 || _dy != 0){
	//same speed diagonally as straight
	var _len = point_distance(0,0,_dx,_dy)
	var _mx = _dx / _len * move_speed
	var _my = _dy / _len * move_speed
	
	
	//move one direction at a time so you slide along walls
	//Obj_lock (locked rooms) blocks the player
	//if (!place_meeting(x + _mx, y , Obj_Lock)) x += _mx
	//if (!place_meeting(x, y + _my, Obj_Lock)) y += _my
	if (!is_blocked(x + _mx, y)) x += _mx
	if (!is_blocked(x, y + _my)) y += _my
	
	//change sprite to match the direction
	if (_dx > 0) sprite_index = PlayerSprite_Right
	else if (_dx < 0) sprite_index = PlayerSprite_Left
	else if (_dy < 0) sprite_index = PlayerSprite_Up
	else sprite_index = PlayerSprite_Down
	
	image_speed = walk_anim_speed
	
}
else
{
//standing still: show the first frame
image_speed = 0
image_index = 0
}

//keep the player inside the room
var _half = target_size / 2
x = clamp(x, _half, room_width - _half)
y = clamp(y, target_size, room_height)

depth = -y;

//standing at a door? Press F to go through it 
//near_door = instance_place(x,y,Obj_Door)
//if (near_door != noone && keyboard_check_pressed(ord("F")))
//{
//	global.spawn_x = near_door.spawn_x
//	global.spawn_y = near_door.spawn_y
//	room_goto(near_door.target_room)
//}