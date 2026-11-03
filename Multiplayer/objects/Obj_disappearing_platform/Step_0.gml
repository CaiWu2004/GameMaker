on = false

//any button with the same link number that is pressed
with (Obj_button_red){
	if (link_id != 0 && link_id == other.link_id && pressed){
		other.on = true
	}
}

//any lever with the same link number that is switched on
with (Obj_switch){
	if (link_id != 0 && link_id == other.link_id && activated){
		other.on = true
	}
}

if (on && !was_on){
	//just turned on: appear, playing backwards (last frame to frame 0)
	if (sprite_index == -1){
		sprite_index = closed_sprite
		image_index = image_number - 1
	}
	visible = true
	image_speed = -1
} else if (!on && was_on){
	//just turned off: play forwards (frame 0 to last frame), then disappear
	if (sprite_index == -1){
		sprite_index = closed_sprite
		image_index = 0
	}
	visible = true
	image_speed = 1
}

was_on = on