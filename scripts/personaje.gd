extends CharacterBody2D

@export var speed := 200.0
@export var jump_velocity := -400.0
@export var gravity := 1200.0

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Saltar automáticamente al tocar el suelo
		velocity.y = jump_velocity

	# Movimiento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	move_and_slide()
