extends Node2D

# Script que representa o controlador do jogo
# (armazena vars usadas em todo o jogo, ex: score, vidas, etc)

var player: MeuPlayer
var scene_limit: Marker2D

var current_scene = null

@onready var score: int = 0
@onready var hud = $HUD


func _ready() -> void:
	# Zera score
	hud.update_score(score)

	var qtd_filhos = get_child_count()
	print("Total de filhos:" + str(qtd_filhos))
	var level = get_child(qtd_filhos - 1)
	player = level.get_node("AnimPlayer")
	player.jumped.connect(player_jumped)
	scene_limit = level.get_node("Position2D")
	print("Limite vertical: " + str(scene_limit.position.y))


func goto_scene(path: String):
	var qtd_filhos = get_child_count()
	print("Total filhos: " + str(qtd_filhos))
	var level := get_child(qtd_filhos - 1)
	level.free()
	var new_scene: PackedScene = ResourceLoader.load(path)
	current_scene = new_scene.instantiate()
	scene_limit = null # indica a troca de cena
	get_tree().get_root().get_child(0).add_child(current_scene)


func _physics_process(delta: float) -> void:
	if current_scene != null and current_scene.name == "GameOver":
		# se for a cena de game over, simplesmente retorna
		return
	if scene_limit == null:
		scene_limit = current_scene.get_node("Position2D")
		player = current_scene.get_node("AnimPlayer")
	if player.position.y > scene_limit.position.y:
		print("Player saiu da tela!")
		#get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		# Troca para o level 2
		#call_deferred("goto_scene", "res://scenes/level2.tscn")
		# ... ou game over, se for o caso
		call_deferred("goto_scene", "res://scenes/game_over.tscn")
		# Não pode trocar imediatamente, pois está no MEIO do frame
		#goto_scene("res://scenes/level2.tscn")


func update_game_score(delta_score):
	score += delta_score
	hud.update_score(score)


func player_jumped():
	print("O jogador pulou!")
