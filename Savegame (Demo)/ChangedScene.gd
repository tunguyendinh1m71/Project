extends Node2D

var change = false

var changed = false

func _on_Timer_timeout():
	change = true
	changed = true
	Signal.stop = true

func _process(_delta):
	if change == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_AnimationPlayer_animation_finished(_anim_name):
	change = false
	if changed == true:
		$CanvasLayer/AnimationPlayer.play("Appear")
		assert(get_tree().change_scene("res://Ganqing.tscn") == OK)
