extends Area2D

var sprite: Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $Sprite2D
	var tween := get_tree().create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(sprite, "modulate", Color.from_rgba8(255, 255, 255, 0), 0.5)
	tween.tween_property(sprite, "scale", Vector2(1.5, 1.5), 0.5)
	tween.tween_property(sprite, "modulate", Color.from_rgba8(255, 255, 255, 255), 0.5)
	tween.tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Saiu da tela!")
	queue_free()
