
var grounded = place_meeting(x, y + 1, obj_wall)
var grounded2 = place_meeting(x,y + 1, obj_end)

xspd += accel * hmove;
yspd += grav;

//if on the ground, reset the double jump.
if (grounded || grounded2){
	double_jump = false;	
}

//if we press jump,
if (jump){
	//if we're on the ground,
	if (grounded || grounded2){
		//set yspeed
		yspd = -jump_strength;
	//otherwise if we haven't used our double jump,
	} else if (!double_jump) {
		//use the double jump
		yspd = -jump_strength;
		double_jump = true;
	}
}

xspd = clamp(xspd, -max_speed, max_speed);

if (hmove == 0){
	xspd = approach(xspd, 0, decel);
}


move_collide();