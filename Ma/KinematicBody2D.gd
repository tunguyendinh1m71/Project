extends KinematicBody2D

var motion = Vector2()

var state = 1 

func _physics_process(_delta):
	if state == 1:
		motion.x = 100
		if $Right.is_colliding():
			 state = 2
	elif state == 2:
		motion.x = -100
		if $Left.is_colliding():
			state = 3
	elif state == 3:
		motion.y = 100
		if $Down.is_colliding():
			state = 4
	elif state == 4:
		motion.y = -100
		if $Up.is_colliding():
			state = 1
	print(state)
	motion = move_and_slide(motion, Vector2(0,-1))
