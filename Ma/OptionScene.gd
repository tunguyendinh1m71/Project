extends Node2D

var tuto = false

var back = false

var play = false

signal na

signal d

signal easy

signal normal

signal hard

const Scene = preload("res://TutorialScene.tscn")

func _ready():
	$VBoxContainer/Easy.grab_focus()
	$VBoxContainer2/Tutorial.grab_focus()

func _on_Tutorial_pressed():
	tuto = true
	emit_signal("na")
	emit_signal("d")

func _on_Back_pressed():
	back = true
	if back == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Easy_pressed():
	emit_signal("easy")
	play = true
	if play == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Normal_pressed():
	emit_signal("normal")
	play = true
	if play == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Hard_pressed():
	emit_signal("hard")
	play = true
	if play == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _process(_delta):
	if tuto == true:
		$TransitionScreen._transition()

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene.instance())

func _on_AnimationPlayer_animation_finished(_anim_name):
	back = false
	$CanvasLayer/AnimationPlayer.play_backwards("Fade")
	assert(get_tree().change_scene("res://Before start.tscn") == OK)
	if play == true:
		$CanvasLayer/AnimationPlayer.play_backwards("Fade")
		assert(get_tree().change_scene("res://Demo.tscn") == OK)
