extends Label

func _ready():
	self.text = "Candies: " + str(CandiesChange.Candies)

func _process(_delta):
	if CandiesChange.Change_scene1 == false:
		self.text =  "Candies: " + str(CandiesChange.Candies)
		if CandiesChange.Change_scene1 == true:
			queue_free()
			CandiesChange.Change_scene1 = false
			
	if CandiesChange.Change_scene2 == false:
		self.text =  "Candies: " + str(CandiesChange.Candies)
		if CandiesChange.Change_scene2 == true:
			queue_free()
			CandiesChange.Change_scene2 = false
	
	if CandiesChange.Candies == 10:
		Change.transit2 = true
		
	if CandiesChange.Candies == 16:
		Change.transit = true
		

func _on_TransitionScreen_transitioned():
	queue_free()
