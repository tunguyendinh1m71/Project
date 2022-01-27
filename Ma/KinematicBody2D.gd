extends KinematicBody2D

var motion = Vector2()

var state = 0

func _physics_process(_delta):
	if state == 0:
		motion.x = 0
	elif state == 1:
		motion.x = 100
	elif state == 2:
		motion.x = -100
	elif state == 3:
		motion.y = 100
	elif state == 4:
		motion.y = -100
	print(state)
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_Timer_timeout():
	state = floor(rand_range(0,5))
