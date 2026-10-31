//function init_movement(){
//	xspd = 0;
//	yspd = 0;
	
//	x_remain = 0;
//	y_remain = 0;
	
//}

function init_movement(){
	xspd = 0;
	yspd = 0;

	x_remain = 0;
	y_remain = 0;

	stop_on_end = false;   // treat obj_end as solid ground? (only obj_not_falling turns this on)
}

function move_collide(){
	
	// this slightly more advanced version of our move_collide function 
	// accounts for speeds that are not integers. The player can't move 
	// .5 pixels, but if our speed is 1.5, we can average it out by moving
	// 1 frame on frame 1, and 2 frames on frame 2, and then repeating.
	
	// first, apply any leftover movement that didn't get applied on previous frames (saved below).
	var xspd_total = xspd + x_remain;
	var yspd_total = yspd + y_remain;
	
	// then store the rounded, integer representation of our movement,
	var xspd_round = floor(abs(xspd_total)) * sign(xspd_total);
	var yspd_round = floor(abs(yspd_total)) * sign (yspd_total);
	
	// and save any leftover movement that didn't get applied for next frame.
	x_remain = xspd_total % 1;
	y_remain = yspd_total % 1;
	
	print(x_remain)
	

	// then we just do our movement from before, using the rounded version of our speed
	for (var _x = 0; _x < abs(xspd_round); _x+=1){
		if (!place_meeting(x + sign(xspd), y, obj_wall)){
			x += sign(xspd);
		} else {
			xspd = 0;	
		}
	}

	for (var _y = 0; _y < abs(yspd_round); _y++){
		var _blocked = place_meeting(x, y + sign(yspd), obj_wall)
                || (stop_on_end && place_meeting(x, y + sign(yspd), obj_end));
		if (!_blocked){
			y += sign(yspd);
		} else {
			yspd = 0;	
		}	
	}

}