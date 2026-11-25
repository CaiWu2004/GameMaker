/// Obj_Interact_Manager - Draw End  (prompt beside the player)
if (target == noone || !instance_exists(target) || !instance_exists(Player)) exit;

var _p = instance_find(Player, 0);
var _text  = "Press F to " + target.interact_prompt;
var _scale = 1 + _p.target_size / 128;           // bigger text when the player is bigger
var _tw    = string_width(_text) * _scale;       // how wide the text is
var _gap   = 8;                                   // space between player and text

var _half  = _p.target_size / 2;                  // half the player's width
var _ty    = _p.y - _p.target_size / 2;           // middle of his body (origin is at his feet)

// Right side by default; flip to the left side if it would go off the room
var _tx;
if (_p.x + _half + _gap + _tw <= room_width)
{
    _tx = _p.x + _half + _gap;
    draw_set_halign(fa_left);                     // text grows to the right
}
else
{
    _tx = _p.x - _half - _gap;
    draw_set_halign(fa_right);                    // text grows to the left
}

draw_set_valign(fa_middle);
draw_set_colour(c_black);
draw_text_transformed(_tx + 2, _ty + 2, _text, _scale, _scale, 0);
draw_set_colour(c_yellow);
draw_text_transformed(_tx, _ty, _text, _scale, _scale, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);