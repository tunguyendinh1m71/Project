extends KinematicBody2D

var motion = Vector2()

var statea = 0

var statea1 = 0

var statea2 = 0

signal gameover

signal losing

var starta = false

var starta1 = false

var starta2 = false

func _ready():
	statea = 0
	statea1 = 0
	statea2 = 0
	$AnimationPlayer.play("Move")

func _on_Easy_pressed():
	starta = true

func _on_Normal_pressed():
	starta1 = true

func _on_Hard_pressed():
	starta2 = true

func _process(_delta):
	if GM.Start == true:
		GM.Option = false
	if Cmode.Continue == 2:
		starta = true
	if Cmode.Continue == 3:
		starta1 = true
	if Cmode.Continue == 4:
		starta2 = true
	if Change.transit == true:
		starta = false
		starta1 = false
		starta2 = false
		statea = 0
		statea1 = 0
		statea2 = 0
	if Change.transit1 == true:
		starta = false
		starta1 = false
		starta2 = false
		statea = 0
		statea1 = 0
		statea2 = 0
	if GM.Option == true:
		queue_free()

func _physics_process(_delta):
	if statea == 0:
		motion.x = 0
		motion.y = 0
	if statea1 == 0:
		motion.x = 0
		motion.y = 0
	if statea2 == 0:
		motion.x = 0
		motion.y = 0
	if starta == true:
		statea = 1
	if starta1 == true:
		statea1 = 1
	if starta2 == true:
		statea2 = 1
	if statea == 1:
		motion.x = 100
		if $Right.is_colliding():
			Cmode.Continue = 0
			starta = false
			statea = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if statea == 2:
		motion.x = -100
		if $Left.is_colliding():
			Cmode.Continue = 0
			starta = false
			statea = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if statea == 3:
		motion.y = 100
		if $Down.is_colliding():
			Cmode.Continue = 0
			starta = false
			statea = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if statea == 4:
		motion.y = -100
		if $Up.is_colliding():
			Cmode.Continue = 0
			starta = false
			statea = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if statea1 == 1:
		motion.x = 150
		if $Right.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if statea1 == 2:
		motion.x = -150
		if $Left.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if statea1 == 3:
		motion.y = 150
		if $Down.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if statea1 == 4:
		motion.y = -150
		if $Up.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if statea2 == 1:
		motion.x = 200
		if $Right.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	if statea2 == 2:
		motion.x = -200
		if $Left.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	if statea2 == 3:
		motion.y = 200
		if $Down.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	if statea2 == 4:
		motion.y = -200
		if $Up.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	print(statea, GM.Hard1)
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_Area2D_body_entered(_body):
	Change.changed1 = true
	CandiesChange.Change_scene = true
	starta = false
	starta1 = false
	starta2 = false
	statea = 0
	statea1 = 0
	statea2 = 0
	emit_signal("gameover")
	emit_signal("losing")

func _on_Candy_change():
	Checkpoint.last_position1 = global_position
	CandiesChange.Change_scene = true
	starta = false
	starta1 = false
	starta2 = false
	statea = 0
	statea1 = 0
	statea2 = 0

func _on_Candy2_change():
	Checkpoint.last_position1 = global_position
	CandiesChange.Change_scene = true
	starta = false
	starta1 = false
	starta2 = false
	statea = 0
	statea1 = 0
	statea2 = 0
