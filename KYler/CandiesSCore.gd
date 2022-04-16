extends Label

func _ready():
	self.text = "Candies: " + str(CandiesChange.Candies)

func _process(_delta):
	if CandiesChange.Change_scene == false:
		self.text =  "Candies: " + str(CandiesChange.Candies)
	if CandiesChange.Change_scene == true:
		queue_free()
		CandiesChange.Change_scene = false
	if CandiesChange.Candies == 10:
		Change.transit1 = true
		print("true")
	if CandiesChange.Candies == 11:
		Change.transit = true
		print("false")
