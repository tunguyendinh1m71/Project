extends Node2D

signal Difficult

func _process(_delta):
	if GM.Hardmode == true:
		emit_signal("Difficult")
		GM.Hardmode = false
	if GM.Option == true:
		queue_free()
	if GM.Start == true:
		GM.Option = false

func _on_TransitionScreen_transitioned():
	queue_free()
