extends KinematicBody2D

signal Ganqing

func _on_Gan_body_entered(_body):
	emit_signal("Ganqing")
