//Obj_RoomManger
//Its meant to allow me to control how to enter each room manually

//persistance so it only need one manager in Home
if (instance_number(object_index) > 1){
	instance_destroy()
	exit
}


//go to a room, but only if it exists
goto_room = function(_room){
	if (room != _room && room_exists(_room)){
		room_goto(_room)
	}
}