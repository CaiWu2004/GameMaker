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
	if (keyboard_check_pressed(vk_space) && on_floor && !jumping && facing != 0){
		mining = true
		mine_did_hit = false
		sprite_index = Player2_Mine
		image_index = 0
		image_speed = 1
		image_xscale = facing * mine_faces
	}
} else {
	//we're mid_swing: the inherited code is skipped, so the player stands still
	
	//the moment the pickaxe lands, break the block in front of us
	if (!mine_did_hit && image_index >= mine_hit_frame){
		mine_did_hit = true
		
		var block = noone
		if (facing >0){
			block = collision_rectangle(bbox_right + 1, bbox_top + 2, bbox_right + mine_reach, bbox_bottom -2, Obj_breakable, false, true)
		} else {
			block = collision_rectangle(bbox_right - mine_reach, bbox_top + 2, bbox_left -1, bbox_bottom -2, Obj_breakable, false, true)
		} 
		if (block != noone){
			with (block) instance_destroy()
		}
	}
}