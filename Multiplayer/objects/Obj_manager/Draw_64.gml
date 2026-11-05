if (room = Room1){
	var _gw = display_get_gui_width()
	
	draw_set_font(Arial)
	draw_set_valign(fa_top)
	
	
	//dark bar behind
	draw_set_alpha(0.6)
	draw_set_color(c_black)
	draw_rectangle(0,0,_gw, 64, false)
	draw_set_alpha(1)
	
	
	//player 1
	draw_set_halign(fa_left)
	draw_set_color(c_white)
	draw_text(20,20, "Player 1: A = Left D = Right W = Jump")
	
	//player 2
	draw_set_halign(fa_right)
	draw_text(_gw - 20, 20, "Player 2: Left/Right = move Up = Jump Space = Mine/Break Block")
	
    //put things back to normal so other drawing isn't affected
	draw_set_halign(fa_left)
	draw_set_color(c_white)
}