extends Area2D



func _ready():
	$AnimationPlayer.play("Bumping")
	


func _on_Area2D_body_entered(_body):
	queue_free()
