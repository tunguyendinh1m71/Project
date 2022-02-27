extends KinematicBody2D

var velocity = Vector2.ZERO

export(int) var move = 200

var begin = false

var begin1 = false

func _on_Easy_pressed():
	begin = true

func _on_Normal_pressed():
	begin = true

func _on_Hard_pressed():
	begin1 = true

func _physics_process(delta):
	if begin == true:
		if Input.is_action_pressed("ui_right"):
			velocity = Vector2(1,0)
			move = 200
		elif Input.is_action_pressed("ui_left"):
			velocity = Vector2(-1,0)
			move = 200
		elif Input.is_action_pressed("ui_down"):
			velocity = Vector2(0,1)
			move = 200
		elif Input.is_action_pressed("ui_up"):
			velocity = Vector2(0,-1)
			move = 200
	if begin1 == true:
		if Input.is_action_pressed("ui_right"):
			velocity = Vector2(1,0)
			move = 150
		elif Input.is_action_pressed("ui_left"):
			velocity = Vector2(-1,0)
			move = 150
		elif Input.is_action_pressed("ui_down"):
			velocity = Vector2(0,1)
			move = 150
		elif Input.is_action_pressed("ui_up"):
			velocity = Vector2(0,-1)
			move = 150
	position += velocity * move * delta
	if $Keqdown.is_colliding():
		move = 0
	elif $Kequp.is_colliding():
		move = 0
	elif $Keqright.is_colliding():
		move = 0
	elif $Keqleft.is_colliding():
		move = 0

func _on_Hori_and_Miyamura_losing():
	move = 0
	begin = false
	begin1 = false

func _on_Candy_change():
	move = 0
	begin = false
	begin1 = false
