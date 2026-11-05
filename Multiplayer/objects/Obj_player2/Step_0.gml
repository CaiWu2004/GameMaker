// Inherit the parent event
//event_inherited();

//if (keyboard_check_pressed(vk_space) && facing != 0) {
//	sprite_index = Player2_Mine;
	
//    var block = noone;
//    if (facing > 0) {
//        block = collision_rectangle(bbox_right + 1, bbox_top + 2, bbox_right + 8, bbox_bottom - 2, Obj_breakable, false, true);
//    } else {
//        block = collision_rectangle(bbox_left - 8, bbox_top + 2, bbox_left - 1, bbox_bottom - 2, Obj_breakable, false, true);
//    }
//    if (block != noone) {
//        with (block) instance_destroy();
//    }
//}


//mining animation

if (!mining){
	//normal movement, jumping and animation come fromplayer 1's code 
	event_inherited()
	
	//start a swing: Space, on the ground, not jumping, facing a direction
	var on_floor = place_meeting(x, y + 1, Obj_wall)
	if (keyboard_check_pressed(vk_space) && facing != 0){
		mining = true
		mine_did_hit = false
		sprite_index = Player2_Mine
		image_index = 0
		image_speed = mine_speed
		image_xscale = facing * mine_faces
	}
} else {
	//we're mid_swing: no walking, but gravity still works, so swinging in the air doesn't freeze us
	yspd += grav

	if (place_meeting(x,y + yspd, Obj_wall)){
		while (!place_meeting(x,y+sign(yspd), Obj_wall)){
			y += sign(yspd)
	}
	yspd = 0
} else {
	y += yspd
}

//the moment the pickaxe lands, break the block in front of us
if (!mine_did_hit && image_index >= mine_hit_frame){
	mine_did_hit = true
	
	//var block = noone
	//if (facing > 0){
	//	block = collision_rectangle(bbox_right + 1, bbox_top + 2, bbox_right + mine_reach, bbox_bottom - 2, Obj_breakable, false, true)
	//	} else {
	//		block = collision_rectangle(bbox_left - mine_reach, bbox_top + 2, bbox_left - 1, bbox_bottom - 2, Obj_breakable, false, true)
	//	}
	//	if (block != noone){
	//		//with (block) instance_destroy()
	//		//burst of stone-gray squares from the middle of the block
	//		//spawn_particles((block.bbox_left + block.bbox_right)/2, (block.bbox_top + block.bbox_bottom)/2,20, make_colour_rgb(126,126,126))
	//		//with (block) instance_destroy()
	//		with (block){
	//			if (!breaking){
	//				breaking = true
	//				shake_time = shake_length
	//			}
	//		}
	//	}
	
	//look ahead for breakable blocks and pick the closest one
	var _list = ds_list_create()
	var _count = 0
	
	if (facing > 0){
		_count = collision_rectangle_list(bbox_right + 1, bbox_top + 2, bbox_right + mine_reach, bbox_bottom - 2, Obj_breakable, false, true, _list, true)
	} else {
		_count = collision_rectangle_list(bbox_left - mine_reach, bbox_top + 2, bbox_left - 1, bbox_bottom - 2, Obj_breakable, false, true, _list, true)
	}
	
	var block = noone
	if (_count > 0){
		//the list is sorted nearest first
		block = _list[| 0] 
	}
	ds_list_destroy(_list)
	
	if (block != noone){
		//start the block shaking: it breaks by itself when the shake ends
		with (block){
			if (!breaking){
				breaking = true
				shake_time = shake_length
			}
		}
	}
	
	
	}
}
