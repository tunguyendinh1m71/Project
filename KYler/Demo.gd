extends Node2D

var youlose = false

var change = false
var change2 = false

var Scene3 = preload("res://Game over.tscn")

var trans = false

func _ready():
	$VBoxContainer/Easy.grab_focus()

func _enter_tree():
	if Checkpoint.last_position:
		$Keqing.global_position = Checkpoint.last_position
		$Enemy.global_position = Checkpoint.last_position1
		$Enemy1.global_position = Checkpoint.last_position2
		
func _process(_delta):
	youlose = true
	if youlose == true:
		$TransitionScreen._transition()
	if Change.transit == true:
		trans = true
		$TransitionScreen/AnimationPlayer.play("fading")

func _on_TransitionScreen_transitioned():
	$Wall.queue_free()
	$Enemy.queue_free()
	$Enemy1.queue_free()
	$Keqing.queue_free()
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Scene3.instance())

func _on_Candy_change():
	change = true
	CandiesChange.Change_scene1 = true
	if change == true and CandiesChange.Change_scene1 == true:
		$TransitionScreen/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	if change == true:
		$TransitionScreen/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Scene.tscn") == OK)
	if change2 == true:
		$TransitionScreen/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Scene1.tscn") == OK)
	if Change.transit == true:
		$TransitionScreen/AnimationPlayer.play("appear")
		assert(get_tree().change_scene("res://Keq.tscn") == OK)


func _on_Candy2_change():
	change2 = true
	CandiesChange.Change_scene2 = true
	if change2 == true and CandiesChange.Change_scene2 == true:
		$TransitionScreen/AnimationPlayer.play("fading")
	
