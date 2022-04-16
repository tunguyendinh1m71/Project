extends Node2D

func _on_Area2D_body_entered(_body):
	CandiesChange.Candies_eaten2 = true
	if CandiesChange.Candies_eaten2 == true:
		CandiesChange.Candies = CandiesChange.Candies + 3
		queue_free()

func _process(_delta):
	if Change.changed == true:
		if CandiesChange.Candies_eaten2 == true:
			queue_free()

func _on_TransitionScreen_transitioned():
	queue_free()
