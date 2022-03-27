extends Node2D

var Keq = false

var Keyu = false

var Keq_pos = null

var Gan_pos = null

var stop = false

signal stop

func _enter_tree():
	if Checkpoint.last_position:
		$Keqing.global_position = Checkpoint.last_position
	if Signal.stop == true:
		stop = true

func _process(_delta):
	if stop == true:
		emit_signal("stop")

func _on_Ganyu_Ganqing():
	Keq = true
	if Keq == true:
		$CanvasLayer/AnimationPlayer.play("Fading")
		Keyu = true
	else:
		Keyu = false

func _on_Keyu_Keyu():
	Keq = true
	if Keq == true:
		$CanvasLayer/AnimationPlayer.play("Fading")
		Keyu = true
	else:
		Keyu = false

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fading":
		if Keyu == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://ChangedScene.tscn") == OK)
