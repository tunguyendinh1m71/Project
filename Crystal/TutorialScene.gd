extends Node2D

var change = false

func _ready():
	$VBoxContainer/BacktoOption.grab_focus()

func _on_BacktoOption_pressed():
	change = true
	if change == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_AnimationPlayer_animation_finished(_anim_name):
	change = false
	$CanvasLayer/AnimationPlayer.play_backwards("Fade")
	assert(get_tree().change_scene("res://OptionScene.tscn") == OK)
