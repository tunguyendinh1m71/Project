extends Label

func _on_Easy_pressed():
	queue_free()

func _on_Normal_pressed():
	queue_free()

func _on_Hard_pressed():
	queue_free()

func _process(_delta):
	if Cmode.Continue == 1:
		queue_free()
	if Cmode.Continue == 2:
		queue_free()
	if Cmode.Continue == 3:
		queue_free()
	if Cmode.Continue == 4:
		queue_free()
