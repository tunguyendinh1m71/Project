extends Node2D

signal change

func _on_Area2D_body_entered(_body):
	if Change.changed == false:
		Checkpoint.last_position = global_position
		emit_signal("change")
		queue_free()

func _process(_delta):
	if Change.changed == true:
		queue_free()

func _on_TransitionScreen_transitioned():
	queue_free()
