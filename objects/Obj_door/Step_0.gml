
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
	visible = false
	sprite_index = -1
	mask_index = -1
} else {
	sprite_index = object_get_sprite(object_index)
	mask_index = -1
	visible = true
}