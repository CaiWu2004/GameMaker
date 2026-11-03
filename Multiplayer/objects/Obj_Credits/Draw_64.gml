//draw_set_font(Arial)
//draw_set_color(c_white)
//draw_text(10,10, myText)

//screen width and height
var _gw = display_get_gui_width()
var _gh = display_get_gui_height()
//margin is 40px border
var _margin = 40
//the width the text may use before it wraps to the next line
var _wrap = _gw - _margin * 2


//fonts
draw_set_font(Arial)
//set anchors to the top left of where I draw it
draw_set_halign(fa_left)
draw_set_valign(fa_top)

//measure how tall the whole text is once wrapped, -1 means default line spacing.
//The furthest the user can scroll is the text height minus the screen height, plus the margins.
//max(0,..) stops it from going negative if the text is shorter than the screen
var _text_h = string_height_ext(myText, -1, _wrap)
var _max_scroll = max(0, _text_h - _gh + _margin * 2)

//holding down adds 8 pixels per frame and holding up subtracts 8
scroll_y += (keyboard_check(vk_down) - keyboard_check(vk_up)) * 8
//one wheel notch moves 40 pixels.
scroll_y += (mouse_wheel_down() - mouse_wheel_up()) * 40
//clamp keeps the scroll between the top(0) and the bottom(_max_scroll) so you can't scroll past either end
scroll_y = clamp(scroll_y, 0, _max_scroll)

//draws the text white on black background
draw_set_color(c_white)
//wrapped to _wrap width. Subtracting scroll_y from the y position moves the text up as you scroll down
draw_text_ext(_margin, _margin - scroll_y, myText, -1, _wrap)

draw_set_color(c_black)
draw_set_alpha(0.7)
draw_rectangle(0, _gh - 28, _gw, _gh, false)
draw_set_alpha(1)
draw_set_color(c_ltgray)
draw_text(_margin, _gh - 24, "Up/Down or mouse wheel to scroll");
draw_set_color(c_white);
