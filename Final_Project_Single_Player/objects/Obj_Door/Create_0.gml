/// Obj_Door - Create
target_room = Street;  
spawn_x = 0;
spawn_y = 0;

make_interactable("enter", function()
{
    global.spawn_x = spawn_x;
    global.spawn_y = spawn_y;
    room_goto(target_room);
}, 24);