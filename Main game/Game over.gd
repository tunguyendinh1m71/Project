extends Node2D

var fading = false

func _ready():
	$VBoxContainer/Restart.grab_focus()

func _on_Restart_pressed():
	fading = true
	if fading == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fading":
		var _change_scene
		fading = false
		$CanvasLayer/AnimationPlayer.play("appear")
		_change_scene = get_tree().change_scene("res://Demo.tscn")

func _on_Quit_pressed():
	var _Menu
	_Menu = get_tree().change_scene("res://Menu/MainMenu.tscn")
