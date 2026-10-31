//if (!variable_instance_exists(id, "activated")) activated = false;

//if (!activated && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
//                                      Obj_Player1, false, true) != noone) {
//    activated = true;
//    sprite_index = Leaver_on;
//    image_index = 0;
//}

//is a player touching the lever right now?
//player 2 works too because its a child of player 1
var touching = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, Obj_Player1, false, true) != noone )

//only toggle at the moment they start touching it
if (touching && !was_touching){
	activated = !activated
	
	if(activated){
		sprite_index = Leaver_on
	} else {
		sprite_index = Leaver_off
	}
}

//remember for next frame
was_touching = touching