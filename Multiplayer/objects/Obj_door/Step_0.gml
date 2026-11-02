
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

