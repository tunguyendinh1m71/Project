extends Node2D


var backa = false

var playa1 = false

var playa2 = false

func _on_Timer_timeout():
	playa1 = true
	backa = true
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
		playa2 = true
		Change.transit = false

func _process(_delta):
	if backa == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	backa = false
	if playa1 == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Demo.tscn") == OK)
	if playa2 == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Demo1.tscn") == OK)
