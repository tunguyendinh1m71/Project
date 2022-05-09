extends Node2D

var back = false

var play1 = false

var play2 = false

var play3 = false

func _on_Timer_timeout():
	play1 = true
	back = true
	Change.changed = true
	GM.Candy = true
	if Cmode.Easy == true:
		Cmode.Continue = 2
		GM.Easy = true
	if Cmode.Normal == true:
		Cmode.Continue = 3
		GM.Normal = true
	if Cmode.Hard == true:
		Cmode.Continue = 4
		GM.Hard = true
		GM.Hardmode = true
	if GM.CS == true:
		play2 = true
		Change.transit = false
	if GM.CS1 == true:
		play3 = true
		Change.transit1 = false
		if GM.CH == true:
			GM.Hard1 = true

func _process(_delta):
	if back == true:
		$CanvasLayer/AnimationPlayer.play("Fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	back = false
	if play1 == true:
		$CanvasLayer/AnimationPlayer.play("Appearing")
		assert(get_tree().change_scene("res://Demo.tscn") == OK)
	if play2 == true:
		$CanvasLayer/AnimationPlayer.play("Appearing")
		assert(get_tree().change_scene("res://Demo1.tscn") == OK)
	if play3 == true:
		$CanvasLayer/AnimationPlayer.play("Appearing")
		assert(get_tree().change_scene("res://Demo2.tscn") == OK)
