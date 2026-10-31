var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
var jump = keyboard_check_pressed(vk_space)
var jump_held = keyboard_check(vk_space);
var grounded = place_meeting(x,y+1,obj_wall)



//timer that loops and resets the jump_strength
//if (timer < 60){
//	timer += 1
//	show_debug_message("Timer: " + string(timer/60))
	
//	//max_speed = random_range(10,50)
//	//grav = random_range(0,2)
//	max_speed += 0.5


//} else {
// timer = 0
// max_speed = 3
//}

//if (keyboard_check(vk_left)  && keyboard_check(vk_right)){
//	max_speed += 1
//} else if (keyboard_check_pressed(vk_left) && keyboard_check_pressed(vk_right)){
//	max_speed += 2
//}

xspd += accel * hmove;
//yspd += grav;

//floaty gravity

var current_grav = grav
var floating = false

if (!grounded){
	if(abs(yspd) < apex_threshold){
		//hang time at the top of the jump
		current_grav = apex_grav
	} else if (yspd > 0){
		//falling
		//current_grav = jump_held ? glide_grav : fall_grav
		if (float_timer > 0){
			float_timer--
			floating = true
			current_grav = float_grav
		} else {
			current_grav = jump_held ? glide_grav : fall_grav 
		}
	}
} else {
	float_timer =0
}

yspd += current_grav
//cap fall speed
//yspd = min(yspd, terminal)

//cap fall spped
if (floating){
	if (yspd > float_max_fall) yspd = approach(yspd, float_max_fall, 0.15);

} else {
yspd = min(yspd, terminal);
}




if(grounded){
	double_jump = false
}

if (jump){
	//jump_strength = random_range(9,12)
		if (grounded){
		yspd = -jump_strength
		float_timer = float_time;
		instance_create_layer(x, bbox_bottom + 5, layer, obj_particle);

		} else if (!double_jump){
			
		yspd = -jump_strength
		double_jump = true
		float_timer = float_time;
		instance_create_layer(x, bbox_bottom + 5, layer, obj_particle);	
		
	} 
}


xspd = clamp(xspd, -max_speed, max_speed);

if (hmove == 0){
	xspd = approach(xspd, 0, decel);
}


move_collide();
//makes it where if the player walks on top of obj_end they get tp away
//var _end = instance_place(x, y + 1, obj_end);
//if (_end != noone) {
//    global.spawnX = _end.targetX;
//    global.spawnY = _end.targetY;
//    room_goto(_end.targetRoom);
//}

var _end = instance_place(x, y + 1, obj_end);
if (_end != noone) {
    x = _end.targetX;
    y = _end.targetY;
    xspd = 0;
    yspd = 0;
    x_remain = 0;
    y_remain = 0;
}


// land: squash wide and short
if (grounded && !was_grounded){
	try_to_scale(1.5, .75);
}

// jump: stretch tall and thin
if (jump){
	//try_to_scale(0.1, 0.3);
	target_xscale = 0.1
	target_yscale= 0.1
}

// slowly ease the actual scale toward the target
try_to_scale(lerp(image_xscale, target_xscale, 0.08),
             lerp(image_yscale, target_yscale, 0.08));

// slowly ease the target back to normal
target_xscale = lerp(target_xscale, 1, 0.05);
target_yscale = lerp(target_yscale, 1, 0.05);

// every frame: ease back toward normal size
try_to_scale(lerp(image_xscale, 1, .15), lerp(image_yscale, 1, .15));

was_grounded = grounded;



//show_debug_message("jump strength: " +  string(jump_strength))
//show_debug_message("max speed: " +  string(max_speed))


if (place_meeting(x, y, obj_enemies)) {
    room_restart();
    exit;
}


/*
if (!place_meeting(x + xspd, y, obj_wall)){
	x += xspd;
} else {
	xspd = 0;	
}
*/