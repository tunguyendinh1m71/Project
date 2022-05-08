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
			if GM.CS == true:
				CandiesChange.Candies1 = CandiesChange.Candies1 + 5
			if GM.CS1 == true:
				CandiesChange.Candies2 = CandiesChange.Candies2 + 5

func _on_TransitionScreen_transitioned():
	queue_free()
