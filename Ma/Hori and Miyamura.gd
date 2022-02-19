extends KinematicBody2D

var motion = Vector2()

var state = 0

var easy = false

var normal = false

var hard = false

signal gameover

signal losing

var start = false

func _ready():
	state = 0

func _on_Signal_easy():
	easy = true

func _physics_process(_delta):
	if state == 0:
		motion.x = 0
		motion.y = 0
	if easy == true:
		if Input.is_action_pressed("ui_select"):
			state = 1
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

func _on_Signal_normal():
	if Input.is_action_pressed("ui_select"):
		start = true
	else:
		start = false
	if start == true:
		state = 1
	if state == 1:
		motion.x = 200
		if $Right.is_colliding():
			 state = 2
	if state == 2:
		motion.x = -200
		if $Left.is_colliding():
			state = 3
	if state == 3:
		motion.y = 200
		if $Down.is_colliding():
			state = 4
	if state == 4:
		motion.y = -200
		if $Up.is_colliding():
			state = 1
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_Signal_hard():
	if Input.is_action_pressed("ui_select"):
		start = true
	else:
		start = false
	if start == true:
		state = 1
	if state == 1:
		motion.x = 300
		if $Right.is_colliding():
			 state = 2
	if state == 2:
		motion.x = -300
		if $Left.is_colliding():
			state = 3
	if state == 3:
		motion.y = 300
		if $Down.is_colliding():
			state = 4
	if state == 4:
		motion.y = -300
		if $Up.is_colliding():
			state = 1
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_Area2D_body_entered(_body):
	state = 0
	emit_signal("gameover")
	emit_signal("losing")
