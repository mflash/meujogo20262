extends Node2D

var total : float = 0

func _ready() -> void:
	update_score(total)
	
func _process(delta: float) -> void:
	print(delta)
	total += delta
	update_score(total)
	
func update_score(current_score: float):
	$Score.text = "Score: " + str(current_score)
	

	
