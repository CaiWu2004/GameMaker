if (on){
	//finished appearing: stay on frame 0, visible and solid
	image_speed = 0
	image_index = 0
} else {
	//finished disappearing: hide it and remove the collision
	image_speed = 0
	visible = false
	sprite_index = -1
}