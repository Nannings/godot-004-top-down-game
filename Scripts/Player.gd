extends KinematicBody2D

export var MOTION_SPEED = 140

func _ready():
	
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size*0.5 - window_size*0.5)

#	set_fixed_process(true)
	pass

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		
	var motion = Vector2()
	
	if  Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		$RayCast2D.set_rotation_degrees(180)
		
	if  Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		$RayCast2D.set_rotation_degrees(0)
		
	if  Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		$RayCast2D.set_rotation_degrees(-90)
		
	if  Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		$RayCast2D.set_rotation_degrees(90)
	
	motion = motion.normalized() * MOTION_SPEED * delta
	move_and_collide(motion)
	
	
		