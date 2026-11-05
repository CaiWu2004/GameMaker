if (breaking){
	shake_time--
	
	//the shake gets weaker as it runs out
	var _power = shake_power * (shake_time / shake_length)
	
	x = home_x + random_range(-_power, _power)
	y = home_y + random_range(-_power,_power)
	
	if (shake_time <= 0){
		//put it back, burst into particles, and break
		x = home_x
		y = home_y
		spawn_particles((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, 20, make_colour_rgb(126, 126, 126))
		instance_destroy()
	}

}