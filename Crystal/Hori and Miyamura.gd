extends KinematicBody2D

var motion = Vector2()

var state = 0

var state1 = 0

var state2 = 0

signal gameover

signal losing

var start = false

var start1 = false

var start2 = false

func _ready():
	state = 0
	state1 = 0
	state2 = 0

func _on_Easy_pressed():
	start = true

func _on_Normal_pressed():
	start1 = true

func _on_Hard_pressed():
	start2 = true

func _process(_delta):
	if Cmode.Continue == 2:
		start = true
	if Cmode.Continue == 3:
		start1 = true
	if Cmode.Continue == 4:
		start2 = true
	if Change.transit == true:
		start = false
		start1 = false
		start2 = false
		state = 0
		state1 = 0
		state2 = 0

func _physics_process(_delta):
	if state == 0:
		motion.x = 0
		motion.y = 0
	if state1 == 0:
		motion.x = 0
		motion.y = 0
	if state2 == 0:
		motion.x = 0
		motion.y = 0
	if start == true:
		state = 1
	if start1 == true:
		state1 = 1
	if start2 == true:
		state2 = 1
	if state == 1:
		motion.x = 100
		if $Right.is_colliding():
			Cmode.Continue = 0
			start = false
			state = 2
			if Cmode.split == true:
				GM.Easy = false
	if state == 2:
		motion.x = -100
		if $Left.is_colliding():
			Cmode.Continue = 0
			start = false
			state = 3
			if Cmode.split == true:
				GM.Easy = false
	if state == 3:
		motion.y = 100
		if $Down.is_colliding():
			Cmode.Continue = 0
			start = false
			state = 4
			if Cmode.split == true:
				GM.Easy = false
	if state == 4:
		motion.y = -100
		if $Up.is_colliding():
			Cmode.Continue = 0
			start = false
			state = 1
			if Cmode.split == true:
				GM.Easy = false
	if state1 == 1:
		motion.x = 150
		if $Right.is_colliding():
			Cmode.Continue = 0
			start1 = false
			state1 = 2
			if Cmode.split == true:
				GM.Normal = false
	if state1 == 2:
		motion.x = -150
		if $Left.is_colliding():
			Cmode.Continue = 0
			start1 = false
			state1 = 3
			if Cmode.split == true:
				GM.Normal = false
	if state1 == 3:
		motion.y = 150
		if $Down.is_colliding():
			Cmode.Continue = 0
			start1 = false
			state1 = 4
			if Cmode.split == true:
				GM.Normal = false
	if state1 == 4:
		motion.y = -150
		if $Up.is_colliding():
			Cmode.Continue = 0
			start1 = false
			state1 = 1
			if Cmode.split == true:
				GM.Normal = false
	if state2 == 1:
		motion.x = 200
		if $Right.is_colliding():
			Cmode.Continue = 0
			start2 = false
			state2 = 2
			if Cmode.split == true:
				GM.Hard = false
	if state2 == 2:
		motion.x = -200
		if $Left.is_colliding():
			Cmode.Continue = 0
			start2 = false
			state2 = 3
			if Cmode.split == true:
				GM.Hard = false
	if state2 == 3:
		motion.y = 200
		if $Down.is_colliding():
			Cmode.Continue = 0
			start2 = false
			state2 = 4
			if Cmode.split == true:
				GM.Hard = false
	if state2 == 4:
		motion.y = -200
		if $Up.is_colliding():
			Cmode.Continue = 0
			start2 = false
			state2 = 1
			if Cmode.split == true:
				GM.Hard = false
	print(state)
	motion = move_and_slide(motion, Vector2(0,-1))

func _on_Area2D_body_entered(_body):
	Change.changed1 = true
	CandiesChange.Change_scene = true
	start = false
	start1 = false
	start2 = false
	state = 0
	state1 = 0
	state2 = 0
	emit_signal("gameover")
	emit_signal("losing")

func _on_Candy_change():
	Checkpoint.last_position1 = global_position
	CandiesChange.Change_scene = true
	start = false
	start1 = false
	start2 = false
	state = 0
	state1 = 0
	state2 = 0
