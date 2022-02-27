extends Node2D

var youlose = false

var change = false

var Scene3 = preload("res://Game over.tscn")

func _ready():
	$VBoxContainer/Easy.grab_focus()

func _process(_delta):
	youlose = true
	if youlose == true:
		$TransitionScreen._transition()

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene3.instance())

func _on_Candy_change():
	change = true
	if change == true:
		$TransitionScreen/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	if change == true:
		$TransitionScreen/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Scene.tscn") == OK)
