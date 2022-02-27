extends Node2D

var back = false

var play = false

func _on_Timer_timeout():
	play = true
	back = true

func _process(_delta):
	if back == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	back = false
	if play == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Demo.tscn") == OK)
