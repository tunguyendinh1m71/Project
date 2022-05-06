extends Node2D

signal change

func _on_Area2D_body_entered(_body):
	CandiesChange.Candies_eatena = true
	if Change.changed == false and CandiesChange.Candies_eatena == true:
		Checkpoint.last_positiona = global_position
		emit_signal("change")
		queue_free()
		
func _process(_delta):
	if Change.changed == true:
		if CandiesChange.Candies_eatena == true:
			CandiesChange.Candies = CandiesChange.Candies + 5
			queue_free()
			
func _on_TransitionScreen_transitioned():
	queue_free()
