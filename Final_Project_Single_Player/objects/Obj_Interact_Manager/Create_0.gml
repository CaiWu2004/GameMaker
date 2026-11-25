/// Obj_Interact_Manager - Create
// Only keep one (it's persistent, so it follows you between rooms)
if (instance_number(object_index) > 1) { instance_destroy(); exit; }

target = noone;  
