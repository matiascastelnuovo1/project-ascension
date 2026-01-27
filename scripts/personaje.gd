extends CharacterBody2D

var base_speed = 200.0
var base_jump_velocity = -400.0
var gravity = 1200.0
var animated_sprite_2d
var speed = base_speed
var jump_velocity = base_jump_velocity

func _ready():
	animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Saltar automáticamente al tocar el suelo
		velocity.y = jump_velocity

	# Movimiento horizontal
	var direction := Input.get_axis("moverse_izquierda", "moverse_derecha")
	velocity.x = direction * speed
	
	if Input.is_action_just_pressed("cambiar_mascara"):
		Global.cambiar_mascara()
		controlador_animacion_mascara()
	
	actualizar_stats()
	move_and_slide()

func controlador_animacion_mascara():

	match Global.estado_mascara_actual:
		Global.ESTADO_MASCARA.AMARILLO:
			animated_sprite_2d.play("amarillo")
		Global.ESTADO_MASCARA.ROJO:
			animated_sprite_2d.play("rojo")
		Global.ESTADO_MASCARA.VERDE:
			animated_sprite_2d.play("verde")

func actualizar_stats():
	match Global.estado_mascara_actual:
		Global.ESTADO_MASCARA.VERDE:
			speed = base_speed
			jump_velocity = base_jump_velocity
		Global.ESTADO_MASCARA.ROJO:
			speed = base_speed * 1.6
			jump_velocity = base_jump_velocity * 1.6
		Global.ESTADO_MASCARA.AMARILLO:
			speed = base_speed * 0.8
			jump_velocity = base_jump_velocity * 0.8
