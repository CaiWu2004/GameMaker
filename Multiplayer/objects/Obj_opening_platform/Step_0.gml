//// Inherit the parent event
//event_inherited();

////if a player ends up inside the platfor, push them out through the top or the bottom

//if (sprite_index != -1){
//	with (Obj_Player1){
//		if (place_meeting(x,y,other)){
//			var _plat_mid = (other.bbox_top + other.bbox_bottom) / 2
//			var _my_mid = (bbox_top + bbox_bottom) / 2
			
			
//			//where the player would stand if pushed above, or below
//			var _up_y = y + (other.bbox_top - 1 - bbox_bottom)
//			var _down_y = y + (other.bbox_bottom + 1 - bbox_top)
			
//			//go to the nearer side
//			var _go_up = (_my_mid < _plat_mid)
			
//			//but not into another wall: use the other side fi the nearer one is blocked
//			if (_go_up && place_meeting(x, _up_y, Obj_wall)){
//				_go_up = false
//			} else if (!_go_up && place_meeting(x, _down_y, Obj_wall)){
//				_go_up = true
//			}
			
//			if (_go_up){
//				y = _up_y
//			} else {
//				y = _down_y
//			}
//			yspd = 0
			
//		}
//	}
//}
// Opening floors animate toward the open end while activated,
// and reverse smoothly toward the closed end when released.
open_now = false;

with (Obj_button_red) {
    if (link_id != 0 && link_id == other.link_id && pressed) {
        other.open_now = true;
    }
}

with (Obj_switch) {
    if (link_id != 0 && link_id == other.link_id && activated) {
        other.open_now = true;
    }
}

image_speed = 0;
var _last_frame = sprite_get_number(closed_sprite) - 1;
var _speed = 0.8;

if (open_now) {
    if (sprite_index != -1) {
        image_index = min(_last_frame, image_index + _speed);
        if (image_index >= _last_frame) {
            image_index = _last_frame;
            sprite_index = -1;
            visible = false;
        }
    }
} else {
    if (sprite_index == -1) {
        sprite_index = closed_sprite;
        image_index = _last_frame;
        visible = true;
    }
    image_index = max(0, image_index - _speed);
}

opened = (sprite_index == -1);
was_open = open_now;

// When the floor returns, move a player out of its collision area.
if (sprite_index != -1) {
    with (Obj_Player1) {
        if (place_meeting(x, y, other)) {
            var _plat_mid = (other.bbox_top + other.bbox_bottom) / 2;
            var _my_mid = (bbox_top + bbox_bottom) / 2;
            var _up_y = y + (other.bbox_top - 1 - bbox_bottom);
            var _down_y = y + (other.bbox_bottom + 1 - bbox_top);
            var _go_up = (_my_mid < _plat_mid);

            if (_go_up && place_meeting(x, _up_y, Obj_wall)) {
                _go_up = false;
            } else if (!_go_up && place_meeting(x, _down_y, Obj_wall)) {
                _go_up = true;
            }

            if (_go_up) {
                y = _up_y;
            } else {
                y = _down_y;
            }
            yspd = 0;
        }
    }
} 