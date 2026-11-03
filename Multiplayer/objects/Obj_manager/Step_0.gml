var _target = -1

for (var i = 1; i <= 6; i++){
	if (keyboard_check_pressed(ord(string(i)))){
		_target = asset_get_index("Room" + string(i))
	}
}

if (keyboard_check_pressed(ord("7"))){
	_target = Credits
}

if (_target != -1 && room_exists(_target)){
	room_goto(_target)
}
	