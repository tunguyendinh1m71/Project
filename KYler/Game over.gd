extends Node2D

var fading = false

var back = false

func _ready():
	$VBoxContainer/Restart.grab_focus()

func _on_Restart_pressed():
	back = false
	fading = true
	Change.changed = false
	Checkpoint.last_position = null
	Checkpoint.last_position1 = null
	Checkpoint.last_position2 = null
	CandiesChange.Candies = 0
	CandiesChange.Candies_eaten = false
	CandiesChange.Candies_eaten1 = false
	CandiesChange.Candies_eaten2 = false
	CandiesChange.Change_scene1 = false
	CandiesChange.Change_scene2 = false
	if fading == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_BacktoMenu_pressed():
	CandiesChange.Change_scene = true
	fading = false
	back = true
	if back == true:
		$CanvasLayer/AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(_anim_name):
	if fading == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		$Label.queue_free()
		assert(get_tree().change_scene("res://Demo.tscn") == OK)
	elif back == true:
		$CanvasLayer/AnimationPlayer.play("appear")
		$Label.queue_free()
		assert(get_tree().change_scene("res://Before start.tscn") == OK)

func _on_Quit_pressed():
	get_tree().quit()
