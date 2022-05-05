extends Node2D

signal Difficult

var emit = false

func _on_Demo2_Difficult():
	emit = true
	if emit == true:
		emit_signal("Difficult")
