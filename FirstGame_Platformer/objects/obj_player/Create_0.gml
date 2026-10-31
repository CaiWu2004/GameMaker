//movement

//moveDir = 0
//moveSpd = 2
//xspd = 0
//yspd= 0

//Jumping
//grav = .275
//terminal = 4
//jspd = -3.15


//tuning variables
accel = 1;
max_speed = 3;
//base gravity (lighter = floatier)
grav = .25;
//gravity while falling
fall_grav = .18
//gravity near the top of the jump
apex_grav = .1
//how close to 0 ysd must be to count as the apex
apex_threshold = 1.5
//max fall speed
terminal = 2.5
//gravity while hilding jump during a fall
glide_grav = .08
jump_strength = 7
double_jump = false

decel = .5;

timer = 0

//float

float_time = 45
float_timer = 0
float_grav = 0.02
float_max_fall = 0.6

was_grounded = false
target_xscale = 1
target_yscale =1


init_movement();