extends Node2D

signal change

func _on_Area2D_body_entered(_body):
	emit_signal("change")
	queue_free()

func _on_TransitionScreen_transitioned():
	queue_free()
