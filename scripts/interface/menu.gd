# Origem do codigo: desenvolvido com ajuda do ChatGPT/OpenAI Codex (menu e botoes).
extends Control

func _ready() -> void:
	$Centro/Painel/Margem/Conteudo/Jogar.pressed.connect(func(): get_tree().change_scene_to_file("res://cenas/jogo/partida.tscn"))
	$Centro/Painel/Margem/Conteudo/Sair.pressed.connect(func(): get_tree().quit())
	$Centro/Painel/Margem/Conteudo/Jogar.grab_focus()
