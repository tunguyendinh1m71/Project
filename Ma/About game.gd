extends Node2D

var change = false

var back = false

func _ready():
	$VBoxContainer/BacktoOption.grab_focus()

func _on_BacktoOption_pressed():
	back = true
	change = true
	if change == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade":
		change = false
		if back == true:
			$CanvasLayer/AnimationPlayer.play("Appear")
			assert(get_tree().change_scene("res://OptionScene.tscn") == OK)
