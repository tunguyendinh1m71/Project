extends Node2D

signal Difficult

var change = false

var changed = false

var gameover = false

var losed = false

func _enter_tree():
	if Checkpoint.last_position:
		$Keqing.global_position = Checkpoint.last_position
		$HoriandMiyamura.global_position = Checkpoint.last_position1

func _on_HoriandMiyamura_gameover():
	gameover = true

func _process(_delta):
	if gameover == true:
		$SceneAnimation/AnimationPlayer.play("Fading")
		losed = true
	if GM.Changing == true: 
		if GM.Easy == true:
			Cmode.Continue = 2
	if GM.Changing == true: 
		if GM.Normal == true:
			Cmode.Continue = 3
	if GM.Changing == true:
		if  GM.Hard == true:
			Cmode.Continue = 4
			emit_signal("Difficult")
			GM.Hard = false

func _on_Candy_change():
	change = true
	if change == true:
		$SceneAnimation/AnimationPlayer.play("Fading")
		changed = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fading":
		if changed == true:
			$SceneAnimation/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Scene.tscn") == OK)
	if anim_name == "Fading":
		if losed == true:
			$SceneAnimation/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Game over.tscn") == OK)