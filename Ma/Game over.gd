extends Node2D

var fading = false

var back = false

func _ready():
	$VBoxContainer/Restart.grab_focus()

func _on_Restart_pressed():
	back = false
	fading = true
	if fading == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_BacktoMenu_pressed():
	fading = false
	back = true
	if back == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	if back == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Before start.tscn") == OK)
	if fading == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Demo.tscn") == OK)

func _on_Quit_pressed():
	get_tree().quit()
