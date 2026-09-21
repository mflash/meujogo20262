extends Node2D

# Script que representa o controlador do jogo
# (armazena vars usadas em todo o jogo, ex: score, vidas, etc)

var player: MeuPlayer

@onready var score: int = 0
@onready var hud = $HUD


func _ready() -> void:
	player = $AnimPlayer
	player.jumped.connect(player_jumped)
	# Zera score
	hud.update_score(score)


func update_game_score(delta_score):
	score += delta_score
	hud.update_score(score)


func player_jumped():
	print("O jogador pulou!")
