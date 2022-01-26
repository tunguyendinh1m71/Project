extends Timer


var Small_coin = preload("res://scene/coin/coin.tscn")


func randomize_coin():
	randomize()
	var coins = [Small_coin]
	var kinds = coins[randi()% coins.size()]
	var coin = kinds.instance()
	coin.position = Vector2(rand_range(10,470), rand_range(10,260))
	add_child(coin)
	wait_time = rand_range(0,6)
	one_shot = false


func _on_Timer_timeout():
	randomize_coin()

