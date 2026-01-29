extends CharacterBody2D

@export var base_speed = 200.0
@export var  base_jump_velocity = -600
@export var gravity := 1200.0
@export var mascara_actual = Global.estado_mascara_actual
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var speed = base_speed
var jump_velocity = base_jump_velocity
var current_extra_layer: int = 2
var animated_sprite_2d

func _ready():
	add_to_group("pers_jugable")

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	#else:
		## Saltar automáticamente al tocar el suelo
		#velocity.y = jump_velocity

	# Movimiento horizontal
	var direction := Input.get_axis("moverse_izquierda", "moverse_derecha")
	velocity.x = direction * speed
	
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = jump_velocity
	
	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:		
		animated_sprite.flip_h = true
	
	if Input.is_action_just_pressed("cambiar_mascara"):
		Global.cambiar_mascara()
		controlador_animacion_mascara()
	
	#actualizar_stats()
	move_and_slide()

func controlador_animacion_mascara():
	match Global.estado_mascara_actual:
		Global.ESTADO_MASCARA.SOL:
			animated_sprite.play("Sol")
		Global.ESTADO_MASCARA.LUNA:
			animated_sprite.play("Luna")

func actualizar_stats():
	match Global.estado_mascara_actual:
		Global.ESTADO_MASCARA.SOL:
			speed = base_speed
			jump_velocity = base_jump_velocity
		Global.ESTADO_MASCARA.LUNA:
			speed = base_speed * 1.6
			jump_velocity = base_jump_velocity * 1.6
		#Global.ESTADO_MASCARA.AMARILLO:
			#speed = base_speed * 0.8
			#jump_velocity = base_jump_velocity * 0.8
			

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cambiar_mascara"):
		cambiar_collision_layer()

func cambiar_collision_layer() -> void:
	# Reset: siempre layer 2
	collision_mask = 1
	print("Antes venia con_", current_extra_layer)
	
	if current_extra_layer == 2:
		current_extra_layer = 3
	else:
		current_extra_layer = 2
	
	set_collision_mask_value(current_extra_layer, true)
	print("Ahora colisionando con layers: 1 y ", current_extra_layer)
