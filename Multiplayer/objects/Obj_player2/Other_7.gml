//the swing finished: go back to normal
if (mining){
	mining = false
	if (jumping){
		//we were in a jump: go back to the jump pose, held on its last frame
		sprite_index = spr_jump
		image_index = image_number - 1
		image_speed = 0
	} else {
		image_index = 0
	}
}