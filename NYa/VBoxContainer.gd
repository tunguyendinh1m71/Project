extends VBoxContainer

var invisible = false

func _on_Start_pressed():
	invisible = true

func _on_Option_pressed():
	invisible = true

func _on_AnimationPlayer_animation_finished(_anim_name):
	if invisible == true:
		queue_free()
		invisible = false

