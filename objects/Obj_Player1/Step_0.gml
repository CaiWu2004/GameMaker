//Read the keys. Each check gives a 1 if key is down, 0 if not
var right = keyboard_check(key_right)
var left = keyboard_check(key_left)
var up = keyboard_check(key_jump)

//right minus left gives 1 (going right), -1 (going left) or 0 (staying still)
var hmovement = right - left 


//remeber the last direction we moved in
if (hmovement != 0){
	facing = hmovement
}

// turn that into pixels to move this frame
//if right hmovement = 1 xspd = 1 * 4 = 4 == move 4 pixels right
var xspd = hmovement * move_speed

//Only move if there is no wall in the way
//check if a spot xspd away or in this case 4 pixels away have a wall, 
//if there is a wall no movement
//if there is no wall. then x += xspd adds that number to the player's x position, 
//which moves them
if (!place_meeting(x + xspd , y, Obj_wall)){
	x += xspd
}

//jumping
//are we standing on something
var grounded = place_meeting(x, y+1, Obj_wall)

//jump only if the key was pressed and we're not grounded
//if (grounded){
//	if (keyboard_check(vk_space)){
//		yspd = -jump_strength
//	}
//}
if (grounded){
	if (keyboard_check(key_jump)){
		yspd = -jump_strength
		
		//start the jump animation, but only when holding right
		if (jump_animation){
			//which way we are jumping
			var jump_dir = hmovement
			if (jump_dir == 0){
				jump_dir = facing
			} 
			
			
			if (jump_dir != 0){
				jumping = true
				image_index = 0
				image_speed = 1
				sprite_index = spr_jump
				//if (jump_dir > 0){
				//	image_xscale = art_faces
				//	sprite_index = spr_jump
				//} else {
				//	image_xscale = -art_faces
				//	sprite_index = spr_jump
				//}
			}
		
		}
	}
}

//gravity 
yspd += grav

//move vertically 
if (place_meeting(x,y+yspd, Obj_wall)){
	while (!place_meeting(x,y+sign(yspd), Obj_wall)){
		y += sign(yspd)
	}
	yspd = 0
} else {
	y += yspd
}

//jump animation
if (jump_animation){

	var on_ground_now = place_meeting(x, y+1, Obj_wall)

	//play the jump ONCE: freeze on the last frame
	if (jumping){
		if (image_index >= image_number - 1){
			image_index = image_number - 1
			image_speed = 0
		}
		//landed: the jump is over
		if (on_ground_now){
			jumping = false
		}
	}

	//when NOT mid-jump, choose between walking and standing
	if (!jumping){
		image_speed = 1
		if (hmovement != 0){
			sprite_index = spr_walk
		} else {
			sprite_index = spr_idle
		}
	}

	//which way does the art of the sprite we're showing face?
	//var face_sign = art_faces
	//if (jumping) face_sign = jump_faces
	var face_sign = art_faces //walking art
	if (jumping){
		face_sign = jump_faces //jump art
	} else if (hmovement == 0){
		face_sign = idle_faces //idle art
	}

	//face the last direction we moved (works in mid-air too)
	if (facing != 0){
		image_xscale = facing * face_sign
	}
}
 