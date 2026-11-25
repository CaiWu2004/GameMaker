/// Obj_Interact_Manager - Step
target = noone;
if (!instance_exists(Player)) exit;

var _p = instance_find(Player, 0);
var _best = noone;
var _best_dist = infinity;

// Look at every instance and find the closest interactable one in range
with (all)
{
    if (variable_instance_exists(id, "interactable") && interactable)
    {
        // Distance from the player's feet to the nearest edge of this object's box
        var _cx = clamp(_p.x, bbox_left, bbox_right);
        var _cy = clamp(_p.y, bbox_top, bbox_bottom);
        var _d  = point_distance(_p.x, _p.y, _cx, _cy);

        if (_d <= interact_range && _d < _best_dist)
        {
            _best_dist = _d;
            _best = id;
        }
    }
}
target = _best;

// Press F -> run that object's action
if (target != noone && keyboard_check_pressed(ord("F")))
{
    with (target) on_interact();
}