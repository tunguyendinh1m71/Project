extends Sprite

var change = false

func _ready():
	$VBoxContainer/Easy.grab_focus()

func _on_Easy_pressed():
	change = true
	if change == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Normal_pressed():
	change = true
	if change == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_Hard_pressed():
	change = true
	if change == true:
		$CanvasLayer/AnimationPlayer.play("Fade")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade":
		change = false
		$CanvasLayer/AnimationPlayer.play("Appear")
