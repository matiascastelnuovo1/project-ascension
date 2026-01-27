extends StaticBody2D

enum ESTADO {activo, innactivo}
var animated_sprite_2d
var collision_shape_2d
@export var color_plataforma: String

func _ready():
	animated_sprite_2d = $AnimatedSprite2D
	collision_shape_2d = $CollisionShape2D
	colorear_plataforma(color_plataforma)

func _physics_process(delta):
	checkear_estado()

func checkear_estado():
	match Global.estado_mascara_actual:
		Global.ESTADO_MASCARA.AMARILLO:
			if color_plataforma == "amarillo":
				animated_sprite_2d.modulate.a = 1
				collision_shape_2d.disabled = false
			else:
				animated_sprite_2d.modulate.a = 0.5
				collision_shape_2d.disabled = true
		Global.ESTADO_MASCARA.ROJO:
			if color_plataforma == "rojo":
				animated_sprite_2d.modulate.a = 1
				collision_shape_2d.disabled = false
			else:
				animated_sprite_2d.modulate.a = 0.5
				collision_shape_2d.disabled = true
		Global.ESTADO_MASCARA.VERDE:
			if color_plataforma == "verde":
				animated_sprite_2d.modulate.a = 1
				collision_shape_2d.disabled = false
			else:
				animated_sprite_2d.modulate.a = 0.5
				collision_shape_2d.disabled = true

func colorear_plataforma(color_plataforma):
	if color_plataforma == "amarillo":
		animated_sprite_2d.play("amarillo")
	if color_plataforma == "verde":
		animated_sprite_2d.play("verde")
	if color_plataforma == "rojo":
		animated_sprite_2d.play("rojo")
