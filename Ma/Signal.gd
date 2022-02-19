extends Node

var easy = false

var normal = false

var hard = false

signal easy

signal normal

signal hard

func _on_OptionScene_easy():
	easy = true
	if easy == true:
		emit_signal("easy")

func _on_OptionScene_normal():
	normal = true
	if normal == true:
		emit_signal("normal")

func _on_OptionScene_hard():
	hard = true
	if hard == true:
		emit_signal("hard")
