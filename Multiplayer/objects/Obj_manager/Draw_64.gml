if (room == Home){
	var _gw = display_get_gui_width()
	var _gh = display_get_gui_height()

	draw_set_font(Arial)
	draw_set_valign(fa_top)
	draw_set_halign(fa_center)

	//title
	draw_set_color(c_yellow)
	draw_text_transformed(_gw / 2, 20, "HOW TO PLAY", 2.5, 2.5, 0)

	//player 1 controls (left)
	draw_set_color(c_aqua)
	draw_text(_gw * 0.25, 110, "PLAYER 1")
	draw_set_color(c_white)
	draw_text(_gw * 0.25, 145,
		"A / D  -  Move left / right\n" +
		"W  -  Jump\n" +
		"GREEN buttons: only you can press them")

	//player 2 controls (right)
	draw_set_color(c_orange)
	draw_text(_gw * 0.75, 110, "PLAYER 2")
	draw_set_color(c_white)
	draw_text(_gw * 0.75, 145,
		"Left / Right arrows  -  Move\n" +
		"Up arrow  -  Jump\n" +
		"Space  -  Swing the pickaxe\n" +
		"RED buttons: only you can press them")

	//steps / puzzle guide
	draw_set_color(c_yellow)
	draw_text(_gw / 2, 300, "HOW THE PUZZLES WORK")
	draw_set_color(c_white)
	draw_text_ext(_gw / 2, 340,
		"1. BUTTONS: stand on a button to hold things open. Step off and they close again.\n" +
		"2. LEVERS: either player walks into a lever to switch it on or off. It stays that way.\n" +
		"3. DOORS AND FLOORS react to the button or lever with the same link number.\n" +
		"4. CRACKED BLOCKS: only Player 2 can break them. Stand close and press Space.\n" +
		"5. WOODEN BLOCK: it only moves when BOTH players stand on the same side\n" +
		"    and hold the direction toward it at the same time.\n" +
		"6. Mind your footing: floors can retract and drop you.\n" +
		"Work together to reach the exit!",
		26, _gw - 200)

	//blinking start prompt
	if ((current_time div 500) mod 2 == 0){
		draw_set_color(c_yellow)
		draw_text_transformed(_gw / 2, _gh - 110, "Press SPACE to start", 1.5, 1.5, 0)
	}

	//small footer
	draw_set_color(c_ltgray)
	draw_text(_gw / 2, _gh - 50, "Keys 1 - 6: jump to a room        Key 7: credits")

	//put things back to normal
	draw_set_color(c_white)
	draw_set_halign(fa_left)
}
//} else if (room = Room1){
//	var _gw = display_get_gui_width()
	
//	draw_set_font(Arial)
//	draw_set_valign(fa_top)
	
	
//	//dark bar behind
//	draw_set_alpha(0.6)
//	draw_set_color(c_black)
//	draw_rectangle(0,0,_gw, 64, false)
//	draw_set_alpha(1)
	
	
//	//player 1
//	draw_set_halign(fa_left)
//	draw_set_color(c_white)
//	draw_text(20,20, "Player 1: A = Left D = Right W = Jump")
	
//	//player 2
//	draw_set_halign(fa_right)
//	draw_text(_gw - 20, 20, "Player 2: Left/Right = move Up = Jump Space = Mine/Break Block")
	
//    //put things back to normal so other drawing isn't affected
//	draw_set_halign(fa_left)
//	draw_set_color(c_white)
//}