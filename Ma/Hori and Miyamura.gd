extends KinematicBody2D

var motion = Vector2()

var state = 0

signal gameover

func _ready():
	state = 0

func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		state = 1
	if state == 0:
		motion.x = 0
		motion.y = 0
	if state == 1:
		motion.x = 100
		if $Right.is_colliding():
			 state = 2
	if state == 2:
		motion.x = -100
		if $Left.is_colliding():
			state = 3
	if state == 3:
		motion.y = 100
		if $Down.is_colliding():
			state = 4
	if state == 4:
		motion.y = -100
		if $Up.is_colliding():
			state = 1
	print(state)
	motion = move_and_slide(motion, Vector2(0,-1))


func _on_Area2D_body_entered(_body):
	state = 0
	emit_signal("gameover")