extends CanvasLayer

var endgame = false

var startgame = false

var beforestart = false

signal transitioned

func _ready():
	_transition()

func _on_StartScene_startgame():
	startgame = true

func _on_Hori_and_Miyamura_gameover():
	endgame = true

func _on_Node2D_play():
	beforestart = true

func _transition():
	if endgame == true:
		$AnimationPlayer.play("fading")
	if startgame == true:
		$AnimationPlayer.play("fading")
	if beforestart == true:
		$AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(anim_name):
	endgame = false
	startgame = false
	beforestart = false
	if anim_name == "fading":
		$AnimationPlayer.play("appear")
		emit_signal("transitioned")
