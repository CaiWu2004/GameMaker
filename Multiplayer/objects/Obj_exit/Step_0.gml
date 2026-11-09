var _p1_in = false
var _p2_in = false

with (Obj_Player1){
	if (object_index == Obj_Player1 && place_meeting(x,y,other)){
		_p1_in = true
	}
}

if (place_meeting(x,y,Obj_player2)){
  _p2_in = true
}

if (_p1_in && _p2_in){
	room_goto_next()
}