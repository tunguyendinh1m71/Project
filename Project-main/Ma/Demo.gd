extends Node2D

var youlose = false

const Scene2 = preload("res://Game over.tscn")

func _process(_delta):
	youlose = true
	if youlose == true:
		$TransitionScreen._transition()

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene2.instance())
