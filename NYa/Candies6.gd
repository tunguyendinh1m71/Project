extends Node2D

func _on_Area2D_body_entered(_body):
	CandiesChange.Candies_eaten6 = true
	if CandiesChange.Candies_eaten6 == true:
		CandiesChange.Candies = CandiesChange.Candies + 2
		if GM.CS == true:
			CandiesChange.Candies1 = CandiesChange.Candies1 + 2
		if GM.CS1 == true:
			CandiesChange.Candies2 = CandiesChange.Candies2 + 2
		queue_free()

func _process(_delta):
	if Change.changed == true:
		if CandiesChange.Candies_eaten6 == true:
			queue_free()
	if Change.changed1 == true:
		if CandiesChange.Candies_eaten6 == true:
			queue_free()

func _on_TransitionScreen_transitioned():
	queue_free()
