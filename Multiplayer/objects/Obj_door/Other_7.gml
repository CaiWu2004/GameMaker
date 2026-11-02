//the opening animation reached its last frame
if (open_now && !opened){
	opened = true
	image_speed = 0
	//hold the last frame instead of loopingback to frame 0
	image_index = image_number - 1
}