extends Node

signal startgame

const Scene2 = preload("res://Demo.tscn")

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		$TransitionScreen._transition()
		emit_signal("startgame")

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene2.instance())
