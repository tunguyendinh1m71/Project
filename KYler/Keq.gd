extends Node2D

var new = false

var old = false

func _on_Timer_timeout():
	Change.changed = false
	Checkpoint.last_position = null
	Checkpoint.last_position1 = null
	Checkpoint.last_position2 = null
	CandiesChange.Candies = 0
	CandiesChange.Candies_eaten = false
	CandiesChange.Candies_eaten1 = false
	CandiesChange.Candies_eaten2 = false
	CandiesChange.Change_scene1 = false
	CandiesChange.Change_scene2 = false
	Change.transit = false
	old = true
	new = true
	GM.Changing = true
	Cmode.split = true

func _process(_delta):
	if old == true:
		$CanvasLayer/AnimationPlayer.play("Fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	old = false
	if new == true:
		$CanvasLayer/AnimationPlayer.play("Appear")
		assert(get_tree().change_scene("res://Demo1.tscn") == OK)
