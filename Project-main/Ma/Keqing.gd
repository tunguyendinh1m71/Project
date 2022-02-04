extends KinematicBody2D

var velocity = Vector2.ZERO

export(int) var move = 200

var begin = false

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		begin = true
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
	
	position += velocity * move * delta
	
	if $Keqdown.is_colliding():
		move = 0
	elif $Kequp.is_colliding():
		move = 0
	elif $Keqright.is_colliding():
		move = 0
	elif $Keqleft.is_colliding():
		move = 0


func _on_Hori_and_Miyamura_gameover():
	move = 0
