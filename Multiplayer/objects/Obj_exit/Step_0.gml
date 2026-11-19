//var _p1_in = false
//var _p2_in = false

//with (Obj_Player1){
//	if (object_index == Obj_Player1 && place_meeting(x,y,other)){
//		_p1_in = true
//	}
//}

//if (place_meeting(x,y,Obj_player2)){
//  _p2_in = true
//}

//if (_p1_in && _p2_in){
//	room_goto_next()
//}
//var _p1_in = false;
//var _p2_in = place_meeting(x, y, Obj_player2);

//with (Obj_Player1) {
//    if (object_index == Obj_Player1 && place_meeting(x, y, other)) {
//        _p1_in = true;
//    }
//}

//if (_p1_in && _p2_in) {
//    if (room == Room1) {
//        room_goto(Room2);
//    } else if (room == Room2) {
//        room_goto(Credits);   // project 2 has no Room3
//    }
//}
var _p1_in = false;
var _p2_in = place_meeting(x, y, Obj_player2);

with (Obj_Player1) {
    if (object_index == Obj_Player1 && place_meeting(x, y, other)) {
        _p1_in = true;
    }
}

if (_p1_in && _p2_in) {
    if (room == Room1) {
        room_goto(Room2);
    } else if (room == Room2) {
        room_goto(Room3);
    } else if (room == Room3) {
        room_goto(Credits);
    }
} 

