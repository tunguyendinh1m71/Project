extends CanvasLayer

var endgame = false

var startgame = false

var beforestart = false

var open = false

var stopit = false

var tuto = false

signal stop

signal transitioned

func _ready():
	_transition()

func _on_StartScene_startgame():
	startgame = true

func _on_Hori_and_Miyamura_gameover():
	endgame = true

func _on_Node2D_play():
	beforestart = true

func _on_Node2D_open():
	open = true

func _on_OptionScene_d():
	tuto = true

func _transition():
	if endgame == true:
		$AnimationPlayer.play("fading")
	if startgame == true:
		$AnimationPlayer.play("fading")
	if beforestart == true:
		$AnimationPlayer.play("fading")
	if open == true:
		$AnimationPlayer.play("fading")
	if tuto == true:
		$AnimationPlayer.play("fading")

func _on_AnimationPlayer_animation_finished(anim_name):
	endgame = false
	startgame = false
	beforestart = false
	open = false
	tuto = false
	if anim_name == "fading":
		$AnimationPlayer.play("appear")
		emit_signal("transitioned")

func _on_OptionScene_na():
	stopit = true
	if stopit == true:
		emit_signal("stop")

