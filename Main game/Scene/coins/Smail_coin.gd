extends Area2D

signal score_collected

func _ready():
	$AnimationPlayer.play("Bumping")


func _on_Area2D_body_entered(_body):
	emit_signal("score_collected")
	queue_free()
