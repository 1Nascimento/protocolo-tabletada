# Origem do codigo: desenvolvido com ajuda do ChatGPT/OpenAI Codex (movimento, animacoes, ataque e vida).
extends CharacterBody2D

signal health_changed(value: int)
signal defeated
@export var speed: float = 230.0
@onready var visual: AnimatedSprite2D = $Visual
var facing: String = "baixo"
var attacking: bool = false
var hit_applied: bool = false
var health: int = 5
var invulnerability: float = 0.0

func _ready() -> void:
	visual.animation_finished.connect(_on_animation_finished)
	visual.frame_changed.connect(_on_frame_changed)
	visual.play("idle_" + facing)
	$Camera.reset_smoothing()

func _unhandled_input(event: InputEvent) -> void:
	if get_parent().finished:
		return
	var keyboard_attack: bool = event is InputEventKey and event.pressed and not event.echo and event.physical_keycode == KEY_SPACE
	var mouse_attack: bool = event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
	if (keyboard_attack or mouse_attack) and not attacking:
		attacking = true
		hit_applied = false
		velocity = Vector2.ZERO
		visual.play("tabletada_" + facing)
		get_viewport().set_input_as_handled()

func _physics_process(delta: float) -> void:
	invulnerability = maxf(0.0, invulnerability - delta)
	visual.modulate.a = 0.45 if invulnerability > 0.0 and int(invulnerability * 12.0) % 2 == 0 else 1.0
	if get_parent().finished:
		visual.pause()
		return
	if attacking:
		velocity = Vector2.ZERO
		return
	var direction := Vector2.ZERO
	if Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT):
		direction.x -= 1.0
	if Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT):
		direction.x += 1.0
	if Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP):
		direction.y -= 1.0
	if Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN):
		direction.y += 1.0
	if direction != Vector2.ZERO:
		if absf(direction.x) >= absf(direction.y):
			facing = "direita" if direction.x > 0.0 else "esquerda"
		else:
			facing = "baixo" if direction.y > 0.0 else "cima"
		visual.play("andar_" + facing)
	else:
		visual.play("idle_" + facing)
	velocity = direction.normalized() * speed
	move_and_slide()

func _on_frame_changed() -> void:
	if not attacking or hit_applied or visual.frame != 1 or get_parent().finished:
		return
	hit_applied = true
	var forward := Vector2.DOWN
	match facing:
		"cima": forward = Vector2.UP
		"esquerda": forward = Vector2.LEFT
		"direita": forward = Vector2.RIGHT
	for enemy in get_tree().get_nodes_in_group("inimigos"):
		var offset: Vector2 = enemy.global_position - global_position
		if offset.length() > 85.0:
			continue
		if offset.length() > 1.0 and offset.normalized().dot(forward) < 0.25:
			continue
		# A mesa bloqueia também a tabletada: o raio usa a camada do cenário.
		var ray := PhysicsRayQueryParameters2D.create(global_position, enemy.global_position, 1)
		if get_world_2d().direct_space_state.intersect_ray(ray).is_empty():
			enemy.take_damage(1)

func take_damage() -> void:
	if health <= 0 or invulnerability > 0.0 or get_parent().finished:
		return
	health -= 1
	invulnerability = 1.0
	health_changed.emit(health)
	if health <= 0:
		defeated.emit()

func _on_animation_finished() -> void:
	if attacking:
		attacking = false
		visual.play("idle_" + facing)


