room_goto(targetRoom)
global.spawnX = targetX
global.spawnY = targetY

// use the instance variables set in creation code (no "var" here!)
//if (variable_instance_exists(id, "targetX")) {
//    global.spawnX = targetX;
//    global.spawnY = targetY;
//} else {
//    // no spawn given: use the player's spawn point from the room editor
//    if (variable_global_exists("spawnX")) {
//        variable_global_unset("spawnX");   // GM 2024+; otherwise use a flag, see below
//    }
//}
//room_goto(targetRoom);