extends Label

signal easy
signal normal
signal hard

func _ready():
	self.text = "Candies: " + str(CandiesChange.Candies2)

func _process(_delta):
	if CandiesChange.Change_scene == false:
		self.text =  "Candies: " + str(CandiesChange.Candies2)
	if CandiesChange.Change_scene == true:
		queue_free()
		CandiesChange.Change_scene = false
	if CandiesChange.Candies2 >= 21:
		if GM.Easy_ending == true:
			print("nya")
			emit_signal("easy")
			
		if GM.Normal_ending == true:
			emit_signal("normal")
			
		if GM.Hard_ending == true:
			emit_signal("hard")
