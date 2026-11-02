// Inherit the parent event
event_inherited();

key_right = vk_right
key_left = vk_left
key_jump = vk_up


jump_strength = 10


spr_idle = Player2_Idle
spr_walk = Player2_Walk
spr_jump = Player2_Jump
art_faces = 1  

//don't use player 1's jump sprite
jump_animation = true

jump_faces = -1   // player 2's jump art faces the opposite way

idle_faces = -1

//mining

//are we in the middle of the swing?
mining = false 
//has this swing already hit
mine_did_hit = false
//the frame where the pickaxe lands
mine_hit_frame = 5
//how far in front of the player the pickaxe reaches (pixels)
mine_reach = 16
//1 if the mining art faces right, -1 if it faces left
mine_faces = 1

