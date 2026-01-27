extends CharacterBody2D

var speed := 200.0
var jump_velocity := -400.0
var gravity := 1200.0
var mascara_actual = Global.estado_mascara_actual
var animated_sprite_2d

func _main():
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
	
	move_and_slide()

func controlador_animacion_mascara():

	match Global.estado_mascara_actual:
		Global.ESTADO_MASCARA.AMARILLO:
			animated_sprite_2d.play("amarillo")
		Global.ESTADO_MASCARA.ROJO:
			animated_sprite_2d.play("rojo")
		Global.ESTADO_MASCARA.VERDE:
			animated_sprite_2d.play("verde")
