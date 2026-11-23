# Origem do codigo: desenvolvido com ajuda do ChatGPT/OpenAI Codex (arena, inimigos, navegacao e fim de jogo).
extends Node2D

const ENEMY = preload("res://cenas/inimigos/aspirador.tscn")
const CELL := 16.0
const GRID_SIZE := Vector2i(105, 59)
const GOAL := 50
const MAX_ENEMIES := 12
var grid := AStarGrid2D.new()
var kills: int = 0
var finished: bool = false
var spawn_timer: float = 0.0
var spawn_points: Array[Vector2] = [Vector2(120, 120), Vector2(820, 120), Vector2(1450, 120), Vector2(120, 470), Vector2(1510, 470), Vector2(240, 800), Vector2(840, 800), Vector2(1440, 800)]
@onready var player: CharacterBody2D = $Jogador
@onready var status: Label = $Interface/Status

func _ready() -> void:
	grid.region = Rect2i(Vector2i.ZERO, GRID_SIZE)
	grid.cell_size = Vector2(CELL, CELL)
	grid.offset = Vector2(CELL / 2.0, CELL / 2.0)
	grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	grid.update()
	# Margem de segurança para o raio de colisão dos aspiradores.
	var obstacles: Array[Rect2] = []
	# A navegação lê as mesmas formas físicas do mapa para evitar divergências.
	for body_name in ["Mesas", "Obstaculos"]:
		for collider in $Laboratorio.get_node(body_name).get_children():
			if collider is CollisionShape2D and collider.shape is RectangleShape2D and not collider.disabled:
				var size: Vector2 = collider.shape.size
				obstacles.append(Rect2(collider.position - size / 2.0, size))
	for y in range(GRID_SIZE.y):
		for x in range(GRID_SIZE.x):
			var cell := Vector2i(x, y)
			var point := grid.get_point_position(cell)
			var blocked := point.x < 80 or point.x > 1590 or point.y < 80 or point.y > 835
			for obstacle in obstacles:
				if obstacle.grow(22.0).has_point(point):
					blocked = true
			grid.set_point_solid(cell, blocked)
	player.health_changed.connect(_on_health_changed)
	player.defeated.connect(_on_player_defeated)
	update_status()
	for i in range(4):
		spawn_enemy()

func _process(delta: float) -> void:
	if finished:
		return
	spawn_timer -= delta
	if spawn_timer <= 0.0:
		spawn_timer = 1.5
		spawn_enemy()

func _unhandled_input(event: InputEvent) -> void:
	if finished and event is InputEventKey and event.pressed and not event.echo and event.physical_keycode == KEY_R:
		get_tree().reload_current_scene()

func spawn_enemy() -> void:
	if get_tree().get_nodes_in_group("inimigos").size() >= MAX_ENEMIES:
		return
	var candidates: Array[Vector2] = []
	for point in spawn_points:
		if point.distance_to(player.global_position) < 220.0:
			continue
		var occupied := false
		for other in get_tree().get_nodes_in_group("inimigos"):
			if point.distance_to(other.global_position) < 50.0:
				occupied = true
		if not occupied:
			candidates.append(point)
	if candidates.is_empty():
		return
	var enemy = ENEMY.instantiate()
	enemy.target = player
	enemy.arena = self
	enemy.position = candidates.pick_random()
	add_child(enemy)

func navigation_direction(from: Vector2, destination: Vector2) -> Vector2:
	var start := Vector2i(int(from.x / CELL), int(from.y / CELL))
	var end := Vector2i(int(destination.x / CELL), int(destination.y / CELL))
	if not grid.is_in_boundsv(start) or not grid.is_in_boundsv(end):
		return Vector2.ZERO
	# O jogador pode encostar mais na mesa que a margem usada pela grade.
	if grid.is_point_solid(end):
		var best := start
		var best_distance := INF
		for y in range(maxi(0, end.y - 2), mini(GRID_SIZE.y, end.y + 3)):
			for x in range(maxi(0, end.x - 2), mini(GRID_SIZE.x, end.x + 3)):
				var candidate := Vector2i(x, y)
				if not grid.is_point_solid(candidate):
					var distance := grid.get_point_position(candidate).distance_squared_to(destination)
					if distance < best_distance:
						best_distance = distance
						best = candidate
		end = best
	var path := grid.get_point_path(start, end)
	if path.size() > 1:
		return from.direction_to(path[1])
	if path.size() == 1:
		return from.direction_to(destination)
	return Vector2.ZERO

func enemy_defeated() -> void:
	if finished:
		return
	kills += 1
	if kills >= GOAL:
		finished = true
		status.text = "VITÓRIA! 50 aspiradores derrotados | R: reiniciar"
		show_result(true)
	else:
		update_status()

func _on_health_changed(_health: int) -> void:
	update_status()

func _on_player_defeated() -> void:
	finished = true
	status.text = "DERROTA! | Abates: %d / %d | R: reiniciar" % [kills, GOAL]
	show_result(false)

func update_status() -> void:
	status.text = "Vida: %d / 5 | Aspiradores: %d / %d" % [player.health, kills, GOAL]


func show_result(won: bool) -> void:
	var background := ColorRect.new()
	background.color = Color(0.01, 0.025, 0.04, 0.9)
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	$Interface.add_child(background)
	var center := CenterContainer.new()
	center.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	background.add_child(center)
	var content := VBoxContainer.new()
	content.custom_minimum_size = Vector2(650, 0)
	content.add_theme_constant_override("separation", 24)
	center.add_child(content)
	var title := Label.new()
	title.text = "LABORATÓRIO RECUPERADO" if won else "TURNO ENCERRADO"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 40)
	title.add_theme_color_override("font_color", Color("45e4df") if won else Color("ffb35c"))
	content.add_child(title)
	var summary := Label.new()
	summary.text = "50 aspiradores fora de combate. Bom trabalho." if won else "%d de 50 aspiradores derrotados. Tente outra vez." % kills
	summary.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	summary.add_theme_font_size_override("font_size", 23)
	content.add_child(summary)
	var retry := Button.new()
	retry.text = "JOGAR NOVAMENTE  [R]"
	retry.custom_minimum_size.y = 70
	retry.add_theme_font_size_override("font_size", 24)
	retry.pressed.connect(func(): get_tree().reload_current_scene())
	content.add_child(retry)
	var menu := Button.new()
	menu.text = "VOLTAR AO MENU"
	menu.custom_minimum_size.y = 55
	menu.add_theme_font_size_override("font_size", 22)
	menu.pressed.connect(func(): get_tree().change_scene_to_file("res://cenas/menu/menu.tscn"))
	content.add_child(menu)
	retry.grab_focus()

