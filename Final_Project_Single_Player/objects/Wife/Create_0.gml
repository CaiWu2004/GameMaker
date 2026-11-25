/// Wife - Create
event_inherited();

sprite_index = Wife_Idle;
image_speed  = 1;

talking     = false;   // true while using the talking sprite

// Draw in front of / behind things based on where her feet are
depth = -y;

npc_name = "Wife";

make_interactable("talk to " + npc_name, function()
{
    talking = !talking;
}, 40);