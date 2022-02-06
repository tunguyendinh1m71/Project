extends CanvasLayer

var endgame = false

var startgame = false

signal transitioned

func _ready():
	_transition()


func _on_Hori_and_Miyamura_gameover():
	endgame = true

func _transition():
	if endgame == true:
		$AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(anim_name):
	endgame = false
	startgame = false
	if anim_name == "fading":
		$AnimationPlayer.play("appear")
		emit_signal("transitioned")
