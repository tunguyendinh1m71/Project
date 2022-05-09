extends Node2D

signal Difficult

var change = false

var changed = false

var change1 = false

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
		$CanvasLayer/AnimationPlayer.play("Fading")
		losed = true
	if GM.Changing == true: 
		if GM.Easy1 == true:
			Cmode.Continue = 2
	if GM.Changing == true: 
		if GM.Normal1 == true:
			Cmode.Continue = 3
	if GM.Changing == true:
		if  GM.Hard1 == true:
			Cmode.Continue = 4
			emit_signal("Difficult")
			GM.Hard1 = false
	if Change.transit2 == true:
		$CanvasLayer/AnimationPlayer.play("Fading")

func _on_Candy_change():
	change = true
	CandiesChange.Change_scene = true
	if change == true and CandiesChange.Change_scene == true :
		$CanvasLayer/AnimationPlayer.play("Fading")
		changed = true

func _on_Candy2_change():
	change1 = true
	CandiesChange.Change_scene = true
	if change1 == true and CandiesChange.Change_scene == true:
		$CanvasLayer/AnimationPlayer.play("Fading")
		changed1 = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fading":
		if changed == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Yu.tscn") == OK)
		if changed1 == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Qing.tscn") == OK)
	if anim_name == "Fading":
		if Change.transit2 == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Ending.tscn") == OK)
	if anim_name == "Fading":
		if losed == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Game over.tscn") == OK)

