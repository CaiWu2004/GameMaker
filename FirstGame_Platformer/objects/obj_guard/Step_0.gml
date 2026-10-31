if (!instance_exists(obj_player)) { hmove = 0; event_inherited(); exit; }

switch (state){
	case hunter_state.idle:
		hmove = 0
		if (distance_to_object(obj_player) < 800){
			state = hunter_state.hunting
		}
	
	break;
	case hunter_state.hunting:
		hmove = sign(obj_player.x - x)
		
		if (obj_player.y < y){
			jump = true
		} else {
			jump = false
		}
		
		if (distance_to_object(obj_player) > 1000){
			state = hunter_state.returning
		}
	
	break;
	case hunter_state.returning:
		hmove = sign(obj_player.x - x)
		
		if (obj_player.y < y){
			jump = true
		} else {
			jump = false
		}
		
		if (point_distance(x,y,start_x, start_y) < 16){
			state = hunter_state.idle
		}
	
	break;
} 


// Inherit the parent event
event_inherited();

