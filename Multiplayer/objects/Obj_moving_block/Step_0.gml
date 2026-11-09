//gravity: fall until we land on something
//yspd += grav
//if (place_meeting(x, y + yspd, Obj_wall)){
//	while (!place_meeting(x, y + sign(yspd), Obj_wall)){
//		y += sign(yspd)
//	}

//	if (yspd > 0){
//		y = floor(y)
//	}
//	yspd = 0
//} else {
//	y += yspd
//}

////who is pushing the block right now?
//p1_push = 0
//p2_push = 0
//p1_id = noone
//p2_id = noone
//var _block = id

//with (Obj_Player1){
//	//skip anything that isn't a real player (no key settings)
//	if (!variable_instance_exists(id, "key_right")){
//		continue
//	}

//	//a player in the middle of a mining swing isn't pushing
//	var _busy = variable_instance_exists(id, "mining") && mining

//	//holding toward the right (1), left (-1), or nothing (0)
//	var _dir = keyboard_check(key_right) - keyboard_check(key_left)

//	//pushing = holding a direction AND touching the block in that direction
//	if (!_busy && _dir != 0 && place_meeting(x + _dir * (move_speed + 1), y, _block)){
//		if (object_index == Obj_Player1){
//			_block.p1_push = _dir
//			_block.p1_id = id
//		} else if (object_index == Obj_player2){
//			_block.p2_push = _dir
//			_block.p2_id = id
//		}
//	}
//}

////--- only move when BOTH players push the same way ---
//if (p1_push != 0 && p1_push == p2_push){
//	var _d = p1_push * push_speed

//	//don't slide into another wall
//	if (!place_meeting(x + _d, y, Obj_wall)){
//		x += _d
//		//carry both pushers along so they stay touching the block
//		p1_id.x += _d
//		p2_id.x += _d
//	}
//}

//gravity: fall until we land on something
yspd += grav

if (place_meeting(x, y + yspd, Obj_wall)){
    while (!place_meeting(x, y + sign(yspd), Obj_wall)){
        y += sign(yspd)
    }

    if (yspd > 0){
        y = floor(y)
    }

    yspd = 0
} else {
    y += yspd
}


//who is pushing the block right now?
p1_push = 0
p2_push = 0
p1_id = noone
p2_id = noone

var _block = id


//--- PLAYER 1 ---
with (Obj_Player1){

    //skip anything that isn't a real player (no key settings)
    if (!variable_instance_exists(id, "key_right")){
        continue
    }

    //a player in the middle of a mining swing isn't pushing
    var _busy = variable_instance_exists(id, "mining") && mining

    //holding toward the right (1), left (-1), or nothing (0)
    var _dir = keyboard_check(key_right) - keyboard_check(key_left)

    //pushing = holding a direction AND touching the block
    if (!_busy && _dir != 0 && place_meeting(x + _dir * (move_speed + 1), y, _block)){
        _block.p1_push = _dir
        _block.p1_id = id
    }
}


//--- PLAYER 2 ---
with (Obj_player2){

    //skip anything that isn't a real player (no key settings)
    if (!variable_instance_exists(id, "key_right")){
        continue
    }

    //a player in the middle of a mining swing isn't pushing
    var _busy = variable_instance_exists(id, "mining") && mining

    //holding toward the right (1), left (-1), or nothing (0)
    var _dir = keyboard_check(key_right) - keyboard_check(key_left)

    //pushing = holding a direction AND touching the block
    if (!_busy && _dir != 0 && place_meeting(x + _dir * (move_speed + 1), y, _block)){
        _block.p2_push = _dir
        _block.p2_id = id
    }
}


//--- MOVE WHEN EITHER PLAYER PUSHES ---
var _push_dir = 0
var _push_id = noone

//Player 1 can push independently
if (p1_push != 0){
    _push_dir = p1_push
    _push_id = p1_id
}

//Player 2 can push independently
else if (p2_push != 0){
    _push_dir = p2_push
    _push_id = p2_id
}


//--- MOVE THE BLOCK ---
if (_push_dir != 0){

    var _d = _push_dir * push_speed

    //don't slide into another wall
    if (!place_meeting(x + _d, y, Obj_wall)){

        x += _d

        //carry the player pushing the block
        if (instance_exists(_push_id)){
            _push_id.x += _d
        }
    }
}