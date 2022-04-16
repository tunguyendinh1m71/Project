extends Node2D

var tuto = false

var back = false

var go = false

var go1 = false

var go2 = false

signal na

signal d

const Scene = preload("res://TutorialScene.tscn")

func _ready():
	$VBoxContainer/Aboutthisgame.grab_focus()
	$VBoxContainer2/Tutorial.grab_focus()

func _on_Tutorial_pressed():
	tuto = true
	emit_signal("na")
	emit_signal("d")

func _on_Back_pressed():
	back = true
	if back == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Aboutthisgame_pressed():
	go = true
	if go == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Aboutthegamemakers_pressed():
	go1 = true
	if go1 == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Abouttheproject_pressed():
	go2 = true
	if go2 == true:
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
	if go == true:
		$CanvasLayer/AnimationPlayer.play_backwards("Fade")
		assert(get_tree().change_scene("res://About game.tscn") == OK)
		go = false
	if go1 == true:
		$CanvasLayer/AnimationPlayer.play_backwards("Fade")
		assert(get_tree().change_scene("res://About Game Makers.tscn") == OK)
		go1 = false
	if go2 == true:
		$CanvasLayer/AnimationPlayer.play_backwards("Fade")
		assert(get_tree().change_scene("res://About Project.tscn") == OK)
		go2 = false

