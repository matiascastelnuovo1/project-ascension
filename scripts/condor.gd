extends CharacterBody2D

@export var speed: float = 100.0
@export var left_limit: float = 0.0
@export var right_limit: float = 1152.0
var sprite
var direction := 1  # 1 = derecha, -1 = izquierda

func _ready():
	sprite = $Sprite2D
	if direction == 1:
		sprite.flip_h = true
	if direction == -1:
		sprite.flip_h = false

func _physics_process(delta):
	velocity.x = speed * direction

	# Cambiar dirección al llegar a los límites
	if global_position.x <= left_limit:
		direction = 1
		sprite.flip_h = true
	elif global_position.x >= right_limit:
		direction = -1
		sprite.flip_h = false
	
	move_and_slide()
