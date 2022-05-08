extends KinematicBody2D

var motion = Vector2()

var stateb = 0

var stateb1 = 0

var stateb2 = 0

signal gameover

signal losing

var startb = false

var startb1 = false

var startb2 = false

func _ready():
	stateb = 0
	stateb1 = 0
	stateb2 = 0
	$AnimationPlayer.play("Move")

func _on_Easy_pressed():
	startb = true

func _on_Normal_pressed():
	startb1 = true

func _on_Hard_pressed():
	startb2 = true

func _process(_delta):
	if Cmode.Continue == 2:
		startb = true
	if Cmode.Continue == 3:
		startb1 = true
	if Cmode.Continue == 4:
		startb2 = true
	if Change.transit == true:
		startb = false
		startb1 = false
		startb2 = false
		stateb = 0
		stateb1 = 0
		stateb2 = 0

func _physics_process(_delta):
	if stateb == 0:
		motion.x = 0
		motion.y = 0
	if stateb1 == 0:
		motion.x = 0
		motion.y = 0
	if stateb2 == 0:
		motion.x = 0
		motion.y = 0
	if startb == true:
		stateb = 1
	if startb1 == true:
		stateb1 = 1
	if startb2 == true:
		stateb2 = 1
	if stateb == 1:
		motion.x = 100
		if $Right.is_colliding():
			Cmode.Continue = 0
			startb = false
			stateb = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if stateb == 2:
		motion.x = -100
		if $Left.is_colliding():
			Cmode.Continue = 0
			startb = false
			stateb = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if stateb == 3:
		motion.y = 100
		if $Down.is_colliding():
			Cmode.Continue = 0
			startb = false
			stateb = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if stateb == 4:
		motion.y = -100
		if $Up.is_colliding():
			Cmode.Continue = 0
			startb = false
			stateb = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
				GM.Easy1 = false
	if stateb1 == 1:
		motion.x = 150
		if $Right.is_colliding():
			Cmode.Continue = 0
			startb1 = false
			stateb1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if stateb1 == 2:
		motion.x = -150
		if $Left.is_colliding():
			Cmode.Continue = 0
			startb1 = false
			stateb1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if stateb1 == 3:
		motion.y = 150
		if $Down.is_colliding():
			Cmode.Continue = 0
			startb1 = false
			stateb1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if stateb1 == 4:
		motion.y = -150
		if $Up.is_colliding():
			Cmode.Continue = 0
			startb1 = false
			stateb1 = randi() % 4+1
			if Cmode.split == true:
				GM.Normal = false
				GM.Normal1 = false
	if stateb2 == 1:
		motion.x = 200
		if $Right.is_colliding():
			Cmode.Continue = 0
			startb2 = false
			stateb2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	if stateb2 == 2:
		motion.x = -200
		if $Left.is_colliding():
			Cmode.Continue = 0
			startb2 = false
			stateb2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	if stateb2 == 3:
		motion.y = 200
		if $Down.is_colliding():
			Cmode.Continue = 0
			startb2 = false
			stateb2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	if stateb2 == 4:
		motion.y = -200
		if $Up.is_colliding():
			Cmode.Continue = 0
			startb2 = false
			stateb2 = randi() % 4+1
			if Cmode.split == true:
				GM.Hard = false
				GM.Hard1 = false
	print(stateb, GM.Hard1)
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_Area2D_body_entered(_body):
	Change.changed1 = true
	CandiesChange.Change_scene = true
	startb = false
	startb1 = false
	startb2 = false
	stateb = 0
	stateb1 = 0
	stateb2 = 0
	emit_signal("gameover")
	emit_signal("losing")

func _on_Candy_change():
	Checkpoint.last_position1 = global_position
	CandiesChange.Change_scene = true
	startb = false
	startb1 = false
	startb2 = false
	stateb = 0
	stateb1 = 0
	stateb2 = 0
