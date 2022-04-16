extends Node

var save = false

signal save 

func _on_Scene_savescene():
	save = true
	if save == true:
		emit_signal("save")
