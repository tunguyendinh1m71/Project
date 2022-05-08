extends Label

signal EasyMode
signal NormalMode
signal HardMode

func _ready():
	self.text = "Candies: " + str(CandiesChange.Candies2)

func _process(_delta):
	if CandiesChange.Change_scene == false:
		self.text =  "Candies: " + str(CandiesChange.Candies2)
	if CandiesChange.Change_scene == true:
		queue_free()
		CandiesChange.Change_scene = false
	if CandiesChange.Candies2 == 2:
			
		if GM.EasyEnding == true:
			print("nya")
			emit_signal("EasyMode")
			
		elif GM.NormalEnding == true:
			emit_signal("NormalMode")
			
		elif GM.HardEnding == true:
			emit_signal("HardMode")
		
