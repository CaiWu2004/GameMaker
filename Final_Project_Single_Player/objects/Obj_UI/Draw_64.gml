var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _cx = _w / 2;

// ----- Edit these -----
var _title    = "The Life of a Gambler";
var _controls = "A / D / W / S or Arrow Keys - Move     Space - Start";
var _author   = "Made by Your Harry Wu, Ryan Liao, Tony S.";
// ----------------------

draw_set_halign(fa_center);

// Title - top center
draw_set_valign(fa_top);
draw_set_colour(c_black);
draw_text_transformed(_cx + 4, 44, _title, 4, 4, 0); // shadow
draw_set_colour(c_yellow);
draw_text_transformed(_cx, 40, _title, 4, 4, 0);

// Controls, with the author underneath - bottom center
draw_set_valign(fa_bottom);
draw_set_colour(c_white);
draw_text_transformed(_cx, _h - 70, _controls, 1.5, 1.5, 0);
draw_set_colour(c_ltgray);
draw_text_transformed(_cx, _h - 30, _author, 1.25, 1.25, 0);

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);