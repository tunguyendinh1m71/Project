extends Node2D

var something = false

var option = false

signal play

signal open

const Scene = preload("res://Demo.tscn")

const Option = preload("res://OptionScene.tscn")

func _ready():
	$VBoxContainer/Start.grab_focus()

func _on_Start_pressed():
	something = true
	emit_signal("play")

func _on_Option_pressed():
	something = true
	option = true
	emit_signal("open")

func _on_Quit_pressed():
	get_tree().quit()

func _process(_delta):
	if something == true:
		$TransitionScreen._transition()

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene.instance())
	if option == true:
		$CurrentScene.get_child(0).queue_free()
		$CurrentScene.add_child(Option.instance())

func _on_TransitionScreen_stop():
	option = false
