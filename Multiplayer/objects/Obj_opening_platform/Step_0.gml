// Inherit the parent event
event_inherited();

//if a player ends up inside the platfor, push them out through the top or the bottom

if (sprite_index != -1){
	with (Obj_Player1){
		if (place_meeting(x,y,other)){
			var _plat_mid = (other.bbox_top + other.bbox_bottom) / 2
			var _my_mid = (bbox_top + bbox_bottom) / 2
			
			
			//where the player would stand if pushed above, or below
			var _up_y = y + (other.bbox_top - 1 - bbox_bottom)
			var _down_y = y + (other.bbox_bottom + 1 - bbox_top)
			
			//go to the nearer side
			var _go_up = (_my_mid < _plat_mid)
			
			//but not into another wall: use the other side fi the nearer one is blocked
			if (_go_up && place_meeting(x, _up_y, Obj_wall)){
				_go_up = false
			} else if (!_go_up && place_meeting(x, _down_y, Obj_wall)){
				_go_up = true
			}
			
			if (_go_up){
				y = _up_y
			} else {
				y = _down_y
			}
			yspd = 0
			
		}
	}
}