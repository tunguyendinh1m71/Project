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
		$CanvasLayer/AnimationPlayer.play("Fading")
		losed = true
	if GM.Changing == true: 
		if GM.Easy1 == true:
			Cmode.Continue = 2
			GM.Easy1 = false
	if GM.Changing == true: 
		if GM.Normal1 == true:
			Cmode.Continue = 3
			GM.Normal1 = false
	if GM.Changing == true:
		if  GM.Hard1 == true:
			Cmode.Continue = 4
			emit_signal("Difficult")
			GM.Hard1 = false
	if Change.Easy_transit == true:
		$CanvasLayer/AnimationPlayer.play("Fading")
			
	if Change.Normal_transit == true:
		$CanvasLayer/AnimationPlayer.play("Fading")
		
	if Change.Hard_transit == true:
		$CanvasLayer/AnimationPlayer.play("Fading")

func _on_Candy_change():
	change = true
	CandiesChange.Change_scene = true
	if change == true and CandiesChange.Change_scene == true :
		$CanvasLayer/AnimationPlayer.play("Fading")
		changed = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fading":
		if changed == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Scene.tscn") == OK)
	if anim_name == "Fading":
		if Change.Easy_transit == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Ending.tscn") == OK)
	if anim_name == "Fading":
		if losed == true:
			$CanvasLayer/AnimationPlayer.play("Appearing")
			assert(get_tree().change_scene("res://Game over.tscn") == OK)


func _on_Score_EasyMode():
	Change.Easy_transit = true

func _on_Score_HardMode():
	Change.Normal_transit = true

func _on_Score_NormalMode():
	Change.Hard_transit = true
