class_name MeuPlayer # para que seja possível usar o nome da classe em outros lugares
extends CharacterBody2D

signal jumped

@export var speed = 300.0
@export var jump_speed := -1000.0
@export var gravity := 2500.0

@onready var sprite = $PlayerSprite


func get_8way_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func get_side_input():
	velocity.x = 0
	var vel := Input.get_axis("left", "right")
	var jump := Input.is_action_just_pressed('ui_select')

	if is_on_floor() and jump:
		velocity.y = jump_speed
		jumped.emit() # notifica quem estiver "ouvindo"
		get_tree().call_group("HUD", "update_game_score", 2)
	velocity.x = vel * speed


func animate_side():
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	else:
		sprite.stop()


func animate():
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	elif velocity.y > 0:
		sprite.play("down")
	elif velocity.y < 0:
		sprite.play("up")
	else:
		sprite.stop()


func move_side(delta):
	velocity.y += gravity * delta
	get_side_input()
	animate_side()
	#print(velocity.x, " ", velocity.y * delta)
	move_and_slide()


func move_8way(delta):
	get_8way_input()
	animate()
	#move_and_collide(velocity*delta)
	move_and_slide()
	#var collision_info = move_and_collide(velocity * delta)
	#if collision_info:
	#	velocity = velocity.bounce(collision_info.get_normal())
	#	move_and_collide(velocity * delta * 10)


func _physics_process(delta: float) -> void:
	#move_8way(delta)
	move_side(delta)


func _on_player_sprite_animation_changed() -> void:
	print("Mudou a direção!") # Replace with function body.
