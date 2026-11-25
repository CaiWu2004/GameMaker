/// Wife - Step

// Stop talking if the player walks away
if (talking && instance_exists(Obj_Interact_Manager) && Obj_Interact_Manager.target != id)
{
    talking = false;
}

// Update the prompt text
interact_prompt = talking ? "stop talking" : "talk to " + npc_name;

// Show the right sprite
var _want = talking ? Wife_Talking : Wife_Idle;
if (sprite_index != _want)
{
    sprite_index = _want;
    image_index  = 0;
}