function spawn_particles(_x,_y,_num,_color = c_gray){
	for (var i = 0; i < _num; i++){
		with (instance_create_depth(_x, _y, -100, Obj_particle)){
			col = _color
		}
	}
}

