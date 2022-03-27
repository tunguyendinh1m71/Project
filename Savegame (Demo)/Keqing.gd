extends KinematicBody2D

var velocity = Vector2.ZERO

export(int) var move = 200

var Right = true

var Left = true

var Up = true

var Down = true

var start = false

func _on_Keyu_Keyu():
	move = 0
	start = false

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		start = true
	if start == true:
		if Right == true:
			if Input.is_action_pressed("Right"):
				velocity = Vector2(1,0)
				move = 200
		if Left == true:
			if Input.is_action_pressed("Left"):
				velocity = Vector2(-1,0)
				move = 200
		if Up == true:
			if Input.is_action_pressed("Up"):
				velocity = Vector2(0,-1)
				move = 200
		if Down == true:
			if Input.is_action_pressed("Down"):
				velocity = Vector2(0,1)
				move = 200
	position += velocity * move * delta
	if $Right.is_colliding():
		move = 0
		Right = false
	else:
		Right = true
	if $Left.is_colliding():
		move = 0
		Left = false
	else:
		Left = true
	if $Down.is_colliding():
		move = 0
		Down = false
	else:
		Down = true
	if $Up.is_colliding():
		move = 0
		Up = false
	else:
		Up = true
