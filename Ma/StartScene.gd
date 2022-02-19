extends Node

signal startgame

const Scene2 = preload("res://Demo.tscn")

var play = false

func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		play = true
		emit_signal("startgame")

func _process(_delta):
	if play == true:
		$TransitionScreen._transition()

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene2.instance())
	play = false
