extends Node2D

signal change

func _on_Area2D_body_entered(_body):
	CandiesChange.Candies_eaten = true
	if Change.changed == false and CandiesChange.Candies_eaten == true:
		Checkpoint.last_position = global_position
		emit_signal("change")
		queue_free()

func _process(_delta):
	if Change.changed == true:
		if CandiesChange.Candies_eaten == true:
			CandiesChange.Candies = CandiesChange.Candies + 5
			queue_free()

func _on_TransitionScreen_transitioned():
	queue_free()
