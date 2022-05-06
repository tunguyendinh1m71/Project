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
	randomize()
	statea = 0
	statea1 = 0
	statea2 = 0

func _on_Easy_pressed():
	starta = true
	
func _on_Normal_pressed():
	starta1 = true

func _on_Hard_pressed():
	starta2 = true

func _process(_delta):
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
		statea = 4
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
	if statea == 2:
		motion.x = -100
		if $Left.is_colliding():
			Cmode.Continue = 0
			starta = false
			statea = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
	if statea == 3:
		motion.y = 100
		if $Down.is_colliding():
			Cmode.Continue = 0
			starta = false
			statea = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
	if statea == 4:
		motion.y = -100
		if $Up.is_colliding():
			Cmode.Continue = 0
			starta = false
			statea = randi() % 4+1
			if Cmode.split == true:
				GM.Easy = false
	if statea1 == 1:
		motion.x = 150
		if $Right.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = 2
			if Cmode.split == true:
				GM.Normal = false
	if statea1 == 2:
		motion.x = -150
		if $Left.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = 3
			if Cmode.split == true:
				GM.Normal = false
	if statea1 == 3:
		motion.y = 150
		if $Down.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = 4
			if Cmode.split == true:
				GM.Normal = false
	if statea1 == 4:
		motion.y = -150
		if $Up.is_colliding():
			Cmode.Continue = 0
			starta1 = false
			statea1 = 1
			if Cmode.split == true:
				GM.Normal = false
	if statea2 == 1:
		motion.x = 200
		if $Right.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = 2
			if Cmode.split == true:
				GM.Hard = false
	if statea2 == 2:
		motion.x = -200
		if $Left.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = 3
			if Cmode.split == true:
				GM.Hard = false
	if statea2 == 3:
		motion.y = 200
		if $Down.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = 4
			if Cmode.split == true:
				GM.Hard = false
	if statea2 == 4:
		motion.y = -200
		if $Up.is_colliding():
			Cmode.Continue = 0
			starta2 = false
			statea2 = 1
			if Cmode.split == true:
				GM.Hard = false
	print(statea)
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_Area2D_body_entered(body):
	Change.changed1 = true
	CandiesChange.Change_scene1 = true
#	CandiesChange.Change_scene2 = true
	starta = false
	starta1 = false
	starta2 = false
	statea = 0
	statea1 = 0
	statea2 = 0
	emit_signal("gameover")
	emit_signal("losing")
	if body.name == "Enemy1":
		if starta == true:
			statea = randi() % 4+1

func _on_Candy_change():
	Checkpoint.last_position1 = global_position
	Checkpoint.last_position2 = global_position
	CandiesChange.Change_scene1 = true
	starta = false
	starta1 = false
	starta2 = false
	statea = 0
	statea1 = 0
	statea2 = 0


func _on_Candy2_change():
	Checkpoint.last_position1 = global_position
	Checkpoint.last_position2 = global_position
	CandiesChange.Change_scene2 = true
	starta = false
	starta1 = false
	starta2 = false
	statea = 0
	statea1 = 0
	statea2 = 0
