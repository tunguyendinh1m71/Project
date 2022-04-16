extends Node2D

var back = false

var play1 = false

var play2 = false

func _on_Timer_timeout():
	play1 = true
	back = true
	Change.changed = true
	if Cmode.Easy == true:
		Cmode.Continue = 2
		GM.Easy = true
	if Cmode.Normal == true:
		Cmode.Continue = 3
		GM.Normal = true
	if Cmode.Hard == true:
		Cmode.Continue = 4
		GM.Hard = true
	if GM.Changing == true:
		play2 = true
		Change.transit = false

func _process(_delta):
	if back == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	back = false
	if play1 == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Demo.tscn") == OK)
	if play2 == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Demo1.tscn") == OK)
