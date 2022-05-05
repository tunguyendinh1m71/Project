extends Area2D

var play = false

var play2 = false

func _on_Timer_timeout():
	play = true

func _on_Demo1_Difficult():
	play = true
	if play ==  true:
		$CanvasLayer/AnimationPlayer.play("Visible")
		play = false
		play2 = true

func _on_AnimationPlayer_animation_started(anim_name):
	if anim_name == "Visible":
		play = false
		play2 = true
	if anim_name == "Invisible":
		play2 = false
		play = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Visible":
		if play == true:
			$CanvasLayer/AnimationPlayer.play("Invisible")
			play = false
			play2 = true
	if anim_name == "Invisible":
		if play2 == true:
			$CanvasLayer/AnimationPlayer.play("Visible")
			play2 = false
			play = true
