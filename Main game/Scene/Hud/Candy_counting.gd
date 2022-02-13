extends CanvasLayer

var scores = 0

func _ready():
	$Score.text = String(scores)
	
	
func _on_Area2D_score_collected():
	scores = scores + 1 
	_ready()


func _on_Hori_and_Miyamura_gameover():
	queue_free()
