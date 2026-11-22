// 1 or Space -> House
if (keyboard_check_pressed(vk_space)
|| keyboard_check_pressed(ord("1"))
|| keyboard_check_pressed(vk_numpad1)){
	goto_room(House)
}

// 2 -> Street
else if (keyboard_check_pressed(ord("2")) || keyboard_check_pressed(vk_numpad2)){
	goto_room(Street)
}

// 3 -> Casino
else if (keyboard_check_pressed(ord("3")) || keyboard_check_pressed(vk_numpad3)){
	goto_room(Casino)
}