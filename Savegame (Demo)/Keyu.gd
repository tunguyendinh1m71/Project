extends Node2D

signal Keyu

func _on_Area2D_body_entered(_body):
	Checkpoint.last_position = global_position
	emit_signal("Keyu")
	queue_free()

func _on_Ganqing_stop():
	pass
