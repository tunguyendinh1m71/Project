extends Label

func _ready():
	self.text = "Candies: " + str(CandiesChange.Candies1)
	
func _process(_delta):
	if CandiesChange.Change_scene == false:
		self.text =  "Candies: " + str(CandiesChange.Candies1)
	if CandiesChange.Change_scene == true:
		queue_free()
		CandiesChange.Change_scene = false
	if CandiesChange.Candies1 == 2:
		Change.transit1 = true
		print("false")
	else:
		Change.transit1 = false
