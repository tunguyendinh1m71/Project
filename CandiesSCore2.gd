extends Label

func _ready():
	self.text = "Candies: " + str(CandiesChange.Candies2)

func _process(_delta):
	if CandiesChange.Change_scene == false:
		self.text =  "Candies: " + str(CandiesChange.Candies2)
	if CandiesChange.Change_scene == true:
		queue_free()
		CandiesChange.Change_scene = false
	if CandiesChange.Candies2 == 10:
		Change.transit2 = true
		print("false")
	else:
		Change.transit2 = false
