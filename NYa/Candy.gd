extends Node2D

signal change

func _on_Candy2_change():
	Change.changed = false

func _on_Area2D_body_entered(_body):
	CandiesChange.Candies_eaten = true
	GM.Candy2 = false
	if Change.changed == false and CandiesChange.Candies_eaten == true:
		Checkpoint.last_position = global_position
		emit_signal("change")
		queue_free()

func _process(_delta):
	if GM.Start == true:
		GM.Option = false
	if Change.changed == true:
		if GM.Candy2 == true:
			CandiesChange.Candies_eaten = false
			queue_free()
		if CandiesChange.Candies_eaten == true:
			CandiesChange.Candies = CandiesChange.Candies + 5
			queue_free()
			if GM.CS == true:
				CandiesChange.Candies1 = CandiesChange.Candies1 + 5
			if GM.CS1 == true:
				CandiesChange.Candies2 = CandiesChange.Candies2 + 5
	if GM.Option == true:
		queue_free()

func _on_TransitionScreen_transitioned():
	queue_free()
