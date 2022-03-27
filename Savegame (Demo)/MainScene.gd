extends Node2D

var change = false

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		change = true
	if change == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade":
		change = false
		$CanvasLayer/AnimationPlayer.play("Appear")
		assert(get_tree().change_scene("res://Ganqing.tscn") == OK)
