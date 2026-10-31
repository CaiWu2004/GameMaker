move_speed = 4

key_right = ord("D")
key_left = ord("A")
key_jump = ord("W")

//for jump and fall
yspd = 0
grav = 0.5
jump_strength = 17

//sprite animation

jump_animation = true
jumping = false
//idle_sprite = sprite_index
//-1 = facing left, 1 = facing right, 0 = facing front
facing = 0 

//subsitution for the sprite
spr_idle = Player1_Idle
spr_walk = Player1_Walk
spr_jump = Player1_Jump
art_faces = 1    // 1 if the artwork faces right, -1 if it faces left

jump_faces = 1    // which way the JUMP art faces: 1 = right, -1 = left

idle_faces = 1 //which way the IDLE art faces: 1 = right, -1 = left
