extends Node2D

signal Difficult

var change = false

var change1 = false

var changed = false

var changed1 = false

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
	if Change.transit1 == true:
		$SceneAnimation/AnimationPlayer.play("Fading")

func _on_Candy_change():
	change = true
	CandiesChange.Change_scene = true
	if change == true and CandiesChange.Change_scene == true :
		$SceneAnimation/AnimationPlayer.play("Fading")
		changed = true

func _on_Candy2_change():
	change1 = true
	CandiesChange.Change_scene = true
	if change1 == true and CandiesChange.Change_scene == true:
		$SceneAnimation/AnimationPlayer.play("Fading")
		changed1 = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fading":
		if changed == true:
			$SceneAnimation/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Ku.tscn") == OK)
		if changed1 == true:
			$SceneAnimation/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Gan.tscn") == OK)
	if anim_name == "Fading":
		if Change.transit1 == true:
			$SceneAnimation/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Ke.tscn") == OK)
	if anim_name == "Fading":
		if losed == true:
			$SceneAnimation/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Game over.tscn") == OK)
