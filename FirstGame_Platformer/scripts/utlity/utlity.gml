function print(_string){
	show_debug_message(_string);	
}

function approach(_start, _end, _val){
	if (_start > _end){
		return max(_start - _val, _end);	
	} else {
		return min(_start + _val, _end);	
	}
}

function try_to_scale(_x, _y){
	var _prevX = image_xscale;
	var _prevY = image_yscale;
	
	image_xscale = _x;
	image_yscale = _y;
	
	if (place_meeting(x, y, obj_wall)){
		image_xscale = _prevX;
		image_yscale = _prevY;
		return false
	}
	return true
}