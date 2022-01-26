extends KinematicBody2D

var velocity = Vector2.ZERO

export(int) var move = 40


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2(1,0)
	elif Input.is_action_pressed("ui_left"):
		velocity = Vector2(-1,0)
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2(0,1)
	elif Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-1)
		
		
	position += velocity * move * delta
