extends Area2D

var play = false

var start = false

func _on_Timer_timeout():
	play = true

func _on_Wall_Difficult():
	play = true
	if play == true:
		$CanvasLayer/AnimationPlayer.play("Visible")
		start = true

func _on_AnimationPlayer_animation_started(anim_name):
	if anim_name == "Visible":
		play = false
		start = true
	if anim_name == "Invisible":
		start = false
		play = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Visible":
		if play == true:
			$CanvasLayer/AnimationPlayer.play("Invisible")
			play = false
			start = true
	if anim_name == "Invisible":
		if start == true:
			$CanvasLayer/AnimationPlayer.play("Visible")
			start = false
			play = true
