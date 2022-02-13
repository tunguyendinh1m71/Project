extends Node2D

var something = false

signal play

const Scene = preload("res://StartScene.tscn")

func _physics_process(_delta):
	if Input.is_action_pressed("ui_something"):
		something = true
		emit_signal("play")

func _process(_delta):
	if something == true:
		$TransitionScreen._transition()

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene.instance())
	something = false
