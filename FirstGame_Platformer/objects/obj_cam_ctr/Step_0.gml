if (shake_duration > 0){
	shake_x = random_range(-shake_amount , shake_amount)
	shake_y = random_range(-shake_amount, shake_amount)
	
	shake_duration -= 1
}

cam_x = lerp(cam_x, obj_player.x - cam_width/2,.1)
cam_y = lerp(cam_y, obj_player.y - cam_height/2,.1)

cam_x = clamp(cam_x, 0, room_width - cam_width)
cam_y = clamp(cam_y, 0, room_height - cam_height)

camera_set_view_pos(global.cam, cam_x + shake_x, cam_y + shake_y)