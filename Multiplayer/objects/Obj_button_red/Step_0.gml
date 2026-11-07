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

//is the right player standing on the button?
pressed = false
var _list = ds_list_create()
var _count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, Obj_Player1, false, true, _list, false)
for (var i = 0; i < _count; i++){
	//only count the player this button belongs to
	if (_list[| i].object_index == allowed_player){
		pressed = true
	}
}

ds_list_destroy(_list)