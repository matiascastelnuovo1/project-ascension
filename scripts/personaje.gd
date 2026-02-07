extends CharacterBody2D

@export var base_speed = 300.0
@export var  base_jump_velocity = -600
@export var gravity := 1200.0
@export var mascara_actual = Global.estado_mascara_actual
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var fmod_jump_emitter: FmodEventEmitter2D = $Camera2D/FmodEventEmitter2D
@onready var fmod_walk_emitter: FmodEventEmitter2D = $StepsEmitter
@onready var fmod_mask_change_emitter: FmodEventEmitter2D = $MaskChangeEmitter

var speed = base_speed
var jump_velocity = base_jump_velocity
var current_extra_layer: int = 2
var animated_sprite_2d
var can_move
var mascara_actual_animaciones
var footStepTimerReset = .4
var footStepTimer = 0

#Añadi esta variable entre corchetes
var frame_actual
#

func _ready():
	add_to_group("pers_jugable")
	match Global.estado_mascara_actual:
		Global.ESTADOS_MASCARA.SOL:
			mascara_actual_animaciones = "sol_"
		Global.ESTADOS_MASCARA.LUNA:
			mascara_actual_animaciones = "luna_"
	set_collision_layer_value(5, true)	


func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Movimiento horizontal
	var direction := Input.get_axis("moverse_izquierda", "moverse_derecha")
	velocity.x = direction * speed
	
	if direction != 0 and is_on_floor():
		if footStepTimer <= 0:
			fmod_walk_emitter.play()
			footStepTimer = footStepTimerReset
		footStepTimer -= delta
	
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = jump_velocity
		fmod_jump_emitter.play()
	
	#Seccion de animaciones
	
	if is_on_floor():
		if velocity.x != 0:
			animated_sprite.play(str(mascara_actual_animaciones + "bailando"))
		else:
			animated_sprite.play(str(mascara_actual_animaciones + "idle"))
	else:
		if animated_sprite.animation != mascara_actual_animaciones + "saltando":
			animated_sprite.play(mascara_actual_animaciones + "saltando")
			animated_sprite.frame = 4

	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:		
		animated_sprite.flip_h = true
	
	if Input.is_action_just_pressed("cambiar_mascara"):
		fmod_mask_change_emitter.play()
		Global.cambiar_mascara()
		controlador_animacion_mascara()
	
	move_and_slide()

func controlador_animacion_mascara():
	match Global.estado_mascara_actual:
		Global.ESTADOS_MASCARA.SOL:
			mascara_actual_animaciones = "sol_"
		Global.ESTADOS_MASCARA.LUNA:
			mascara_actual_animaciones = "luna_"

func actualizar_stats():
	match Global.estado_mascara_actual:
		Global.ESTADOS_MASCARA.SOL:
			speed = base_speed
			jump_velocity = base_jump_velocity
		Global.ESTADOS_MASCARA.LUNA:
			speed = base_speed * 1.6
			jump_velocity = base_jump_velocity * 1.6
			

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cambiar_mascara"):
		cambiar_collision_layer()

func cambiar_collision_layer() -> void:
	# Desactivar la layer actual (2 o 3)
	set_collision_mask_value(current_extra_layer, false)
	
	# Cambiar entre 2 y 3
	if current_extra_layer == 2:
		current_extra_layer = 3
	else:
		current_extra_layer = 2
	
	# Activar la nueva
	set_collision_mask_value(current_extra_layer, true)
	
# Funcion de empuje de enemigo
func push(from_position: Vector2):
	can_move = false	
	var dir = (global_position - from_position).normalized()	
	var tween := create_tween()
	
	tween.tween_property(
		self,
		"global_position",
		global_position + dir * 80,
		0.25
	)
	
	tween.finished.connect(func():
		can_move = true
	)
