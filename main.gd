extends Node2D

var total: float = 0
const SPEED: int = 100


func _ready() -> void:
	update_score(total)


func _input(event: InputEvent) -> void:
	pass
	#print(event.as_text())
	#if event.is_action_pressed("ui_right"):
	#	print("Right arrow")


func _physics_process(delta: float) -> void:
	print(delta)
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
	elif Input.is_action_pressed("ui_left"):
		position.x -= SPEED * delta


func _process(delta: float) -> void:
	#print(delta)
	total += delta
	update_score(total)


func update_score(current_score: float):
	$Score.text = "Score: " + str(current_score)
