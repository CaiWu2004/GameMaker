/// Wife - Draw End  (name tag above her head, always on top)

var _tag_y = y - sprite_height + 20;       // just above her head
var _scale = 1.5;
var _tw = string_width(npc_name) * _scale;
var _th = string_height(npc_name) * _scale;
var _pad = 6;

// Dark box behind the name
draw_set_alpha(0.75);
draw_set_colour(c_black);
draw_roundrect_ext(x - _tw / 2 - _pad, _tag_y - _th - _pad,
                   x + _tw / 2 + _pad, _tag_y + _pad / 2, 10, 10, false);
draw_set_alpha(1);

// The name
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_colour(c_white);
draw_text_transformed(x, _tag_y, npc_name, _scale, _scale, 0);

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);