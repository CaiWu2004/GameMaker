
open_now = false

//any button (red or green) wuth the same link number that is pressed
with (Obj_button_red){
	if (link_id != 0 && link_id == other.link_id && pressed){
		other.open_now = true
	}
}

//any lever with the same link number that is switched on
with (Obj_switch){
	if (link_id != 0 && link_id == other.link_id && activated){
		other.open_now = true
	}
}

if (open_now){
	//the moment it becomes open: start the animation from the first frame
	if (!was_open){
	sprite_index = closed_sprite
	image_index = 0
	image_speed = 1
	opened= false
	} 

	if (opened){
		visible = false
		sprite_index = -1
		mask_index = -1
	}
} else {
	//closed:show the door, stil, on its first frame
	sprite_index = closed_sprite
	image_index = 0
	image_speed = 0
	mask_index = -1
	visible = true
	opened = false
}

was_open = open_now

//if a player ends up inside the closed door, push them out to the left or right
//(object_index check: Obj_opening_platform inherits this event and pushes up/down instead)
if (object_index == Obj_door && sprite_index != -1){
	with (Obj_Player1){
		if (place_meeting(x, y, other)){
			var _door_mid = (other.bbox_left + other.bbox_right) / 2
			var _my_mid = (bbox_left + bbox_right) / 2

			//where the player would stand if pushed to the left, or to the right
			var _left_x = x + (other.bbox_left - 1 - bbox_right)
			var _right_x = x + (other.bbox_right + 1 - bbox_left)

			//go to the nearer side
			var _go_left = (_my_mid < _door_mid)

			//but not into another wall: use the other side if the nearer one is blocked
			if (_go_left && place_meeting(_left_x, y, Obj_wall)){
				_go_left = false
			} else if (!_go_left && place_meeting(_right_x, y, Obj_wall)){
				_go_left = true
			}

			if (_go_left){
				x = _left_x
			} else {
				x = _right_x
			}
		}
	}
}

