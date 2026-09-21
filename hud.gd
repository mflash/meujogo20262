extends CanvasLayer

@onready var scoreLabel: Label = $Score


func update_score(score) -> void:
	print("Atualizando score!")
	$Score.text = "Score: " + str(score)
