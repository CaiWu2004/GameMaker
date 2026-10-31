//if (keyboard_check_pressed(ord("D"))){
//	room_goto_next()
//} else if (keyboard_check_pressed(ord("A"))){
//	if (!room == Room){
//		room_goto_previous()
//	} else {
//		room_restart()
//	}
	
//} 

//else if (room == Final) {
//    if (keyboard_check_pressed(vk_space)){
//        global.spawnX = 192;
//        global.spawnY = 448;
//        room_goto(Room);
//    }
//}

if (keyboard_check_pressed(ord("D"))){
       global.spawnX = -1;
    if (room == Room2){
        room_goto(Room);
    } else {
        room_goto_next();
    }
} else if (keyboard_check_pressed(ord("A"))){
    global.spawnX = -1;
    if (!room == Room){
        room_goto_previous()
    } else {
        room_restart()
    }
}