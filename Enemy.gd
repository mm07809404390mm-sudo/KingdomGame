extends CharacterBody2D

@export var speed = 200.0
@onready var player = get_node("../Player")

func _physics_process(delta):
	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()