pressed = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
                               Obj_Player1, false, true) != noone);

if (pressed){
	//playe the animation ONCE and stop on the last frame
	image_speed = 1
	if (image_index >= image_number -1 ){
		image_index = image_number - 1
		image_speed = 0
	}
} else {
	//nobody on it: stay still on the first frame
	image_speed = 0
	image_index = 0
}