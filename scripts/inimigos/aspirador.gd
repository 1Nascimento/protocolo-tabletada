# Origem: implementação com assistência de OpenAI Codex.
extends CharacterBody2D

enum State { CHASING, STUNNED, ATTACKING, DEAD, STOPPED }
@export var speed: float = 100.0
@onready var visual: AnimatedSprite2D = $Visual
var target: CharacterBody2D
var arena
var health: int = 2
var state: State = State.CHASING
var facing: String = "baixo"
var state_timer: float = 0.0
var path_timer: float = 0.0
var travel_direction := Vector2.ZERO

func _ready() -> void:
	add_to_group("inimigos")
	path_timer = randf_range(0.0, 0.2)
	change_state(State.CHASING)

func change_state(next_state: State) -> void:
	state = next_state
	velocity = Vector2.ZERO
	match state:
		State.CHASING:
			path_timer = 0.0
			visual.play("mover_" + facing)
		State.STUNNED:
			state_timer = 0.3
			visual.play("dano_" + facing)
		State.ATTACKING:
			state_timer = 0.6
			visual.pause()
			target.take_damage()
		State.DEAD:
			remove_from_group("inimigos")
			arena.enemy_defeated()
			queue_free()
		State.STOPPED:
			visual.pause()

func _physics_process(delta: float) -> void:
	if state == State.DEAD:
		return
	if not is_instance_valid(target) or arena.finished:
		if state != State.STOPPED:
			change_state(State.STOPPED)
		return
	match state:
		State.CHASING:
			chase(delta)
		State.STUNNED, State.ATTACKING:
			state_timer -= delta
			if state_timer <= 0.0:
				change_state(State.CHASING)

func chase(delta: float) -> void:
	path_timer -= delta
	if path_timer <= 0.0:
		travel_direction = arena.navigation_direction(global_position, target.global_position)
		path_timer = 0.2 + randf_range(0.0, 0.08)
	if travel_direction != Vector2.ZERO:
		if absf(travel_direction.x) > absf(travel_direction.y):
			facing = "direita" if travel_direction.x > 0 else "esquerda"
		else:
			facing = "baixo" if travel_direction.y > 0 else "cima"
	visual.play("mover_" + facing)
	velocity = travel_direction * speed
	move_and_slide()
	if global_position.distance_to(target.global_position) < 34.0:
		change_state(State.ATTACKING)

func take_damage(amount: int) -> void:
	if state == State.DEAD or state == State.STOPPED:
		return
	health -= amount
	change_state(State.DEAD if health <= 0 else State.STUNNED)
