// Inherit the parent event
event_inherited();

//if there us no platform to step on
	//turn around
//if not (position_meeting(x + (hmove * sprite_width/2),y + 1,obj_wall)){
//	hmove *= -1
//} else if (position_meeting(x + (hmove * sprite_width/2),y + 1,obj_end)){
//	hmove *= -1
//}

var _edge_x = x + hmove * sprite_width / 2;
var _ground = position_meeting(_edge_x, y + 1, obj_wall)
           || position_meeting(_edge_x, y + 1, obj_end);

if (!_ground) hmove *= -1;

