extends KinematicBody2D

var velocity = Vector2.ZERO

export(int) var move = 200

var begin = false

var begin1 = false

var Right = true

var Left = true

var Up = true

var Down = true

func _ready():
	Right = true
	Left = true
	Up = true
	Down = true
	begin = false
	begin1 = false

func _on_Easy_pressed():
	begin = true

func _on_Normal_pressed():
	begin = true

func _on_Hard_pressed():
	begin1 = true

func _process(_delta):
	if GM.Start == true:
		GM.Option = false
	if Cmode.Continue == 2:
		begin = true
	if Cmode.Continue == 3:
		begin = true
	if Cmode.Continue == 4:
		begin1 = true
	if Change.transit == true:
		move = 0
		begin = false
		begin1 = false
	if Change.transit1 == true:
		move = 0
		begin = false
		begin1 = false
	if GM.Option == true:
		queue_free()

func _physics_process(delta):
	if begin == true:
		if Input.is_action_pressed("ui_right"):
			if Right == true:
				velocity = Vector2(1,0)
				move = 200
				$AnimationPlayer.play("Move_right")
		if Input.is_action_pressed("ui_left"):
			if Left == true:
				velocity = Vector2(-1,0)
				move = 200
				$AnimationPlayer.play("Move_left")
		if Input.is_action_pressed("ui_down"):
			if Down == true:
				velocity = Vector2(0,1)
				move = 200
				$AnimationPlayer.play("Move_down")
		if Input.is_action_pressed("ui_up"):
			if Up == true:
				velocity = Vector2(0,-1)
				move = 200
				$AnimationPlayer.play("Move_up")
	if begin1 == true:
		if Input.is_action_pressed("ui_right"):
			if Right == true:
				velocity = Vector2(1,0)
				move = 150
				$AnimationPlayer.play("Move_right")
		if Input.is_action_pressed("ui_left"):
			if Left == true:
				velocity = Vector2(-1,0)
				move = 150
				$AnimationPlayer.play("Move_left")
		if Input.is_action_pressed("ui_down"):
			if Down == true:
				velocity = Vector2(0,1)
				move = 150
				$AnimationPlayer.play("Move_down")
		if Input.is_action_pressed("ui_up"):
			if Up == true:
				velocity = Vector2(0,-1)
				move = 150
				$AnimationPlayer.play("Move_up")
	position += velocity * move * delta
	if $Keqdown.is_colliding():
		move = 0
		Down = false
	else:
		Down = true
	if $Kequp.is_colliding():
		move = 0
		Up = false
	else:
		Up = true
	if $Keqright.is_colliding():
		move = 0
		Right = false
	else:
		Right = true
	if $Keqleft.is_colliding():
		move = 0
		Left = false
	else:
		Left = true

func _on_HoriandMiyamura_losing():
	move = 0
	begin = false
	begin1 = false

func _on_Candy_change():
	CandiesChange.Change_scene = true
	move = 0
	begin = false
	begin1 = false

func _on_Candy2_change():
	CandiesChange.Change_scene = true
	move = 0
	begin = false
	begin1 = false

func _on_Enemy2_losing():
	move = 0
	begin = false
	begin1 = false

func _on_Enemy1_losing():
	move = 0
	begin = false
	begin1 = false
