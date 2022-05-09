extends Node2D

var new = false

var old = false

func _on_Timer_timeout():
	Change.changed = false
	Change.changed1 = false
	Checkpoint.last_position = null
	Checkpoint.last_position1 = null
	CandiesChange.Candies = 0
	CandiesChange.Candies1 = 0
	CandiesChange.Candies2 = 0
	CandiesChange.Candies_eaten = false
	CandiesChange.Candies_eaten1 = false
	CandiesChange.Candies_eaten2 = false
	CandiesChange.Candies_eaten3 = false
	CandiesChange.Candies_eaten4 = false
	CandiesChange.Candies_eaten5 = false
	CandiesChange.Candies_eaten6 = false
	CandiesChange.Candies_eaten7 = false
	CandiesChange.Change_scene = false
	Change.transit = false
	Change.transit1 = false
	GM.Candy = false
	GM.Candy2 = false
	old = true
	new = true
	GM.Changing = true
	Cmode.split = true
	GM.CS = true

func _process(_delta):
	if old == true:
		$CanvasLayer/AnimationPlayer.play("Fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	old = false
	if new == true:
		$CanvasLayer/AnimationPlayer.play("Appear")
		assert(get_tree().change_scene("res://Demo1.tscn") == OK)
