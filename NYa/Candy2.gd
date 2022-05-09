extends Node2D

signal change

func _on_Candy_change():
	Change.changed1 = false

func _on_Area2D_body_entered(_body):
	CandiesChange.Candies_eaten7 = true
	GM.Candy = false
	if Change.changed1 == false:
		if CandiesChange.Candies_eaten7 == true:
			Checkpoint.last_position = global_position
			emit_signal("change")
			queue_free()

func _process(_delta):
	if GM.Start == true:
		GM.Option = false
	if Change.changed1 == true:
		if GM.Candy == true:
			CandiesChange.Candies_eaten7 = false
			queue_free()
		if CandiesChange.Candies_eaten7 == true:
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
