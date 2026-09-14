extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_dir = 0
var target = position # posição do nodo

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		
func get_mouse_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * speed
	
func get_rotation_input():
	rotation_dir = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed
	#print(velocity)

func get_8way_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	print(input_dir)
	velocity = input_dir * speed
	
func _physics_process(delta: float) -> void:
	# 1. movimento 8-way
	#get_8way_input()
	
	# 2. movimento frente-trás com rotação
	#get_rotation_input()
	#rotation += rotation_dir * rotation_speed * delta
	
	# 3. Gira com o mouse
	get_mouse_input()
	move_and_slide()
	
	# 4. Point and click com o mouse
	#velocity = position.direction_to(target) * speed
	#look_at(target)
	#if position.distance_to(target) > 10:
	#	move_and_slide()
