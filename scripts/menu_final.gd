extends Node2D

var tween: Tween
@onready var currentLabel = $MenuPrincipal/TextoFinal
@onready var spriteAnimated = $AnimatedSprite2D2
@onready var tiempoFinal = $MenuPrincipal/TiempoFinal
@onready var caidasTotales = $MenuPrincipal/CaidasTotales
@export var duration: float = 0.8

func _ready() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween()
	tween.tween_property(currentLabel, "visible_characters", 120, duration)
	caidasTotales.text = "Caidas totales: " + str(Global.caidas)
	tiempoFinal.text = "Tiempo: " + str(Global.tiempoJuego)


func _on_boton_jugar_pressed() -> void:	
	Global.restaurar_estado_global()
	get_tree().change_scene_to_file("res://scenes/juego/menu.tscn")

func _on_boton_salir_pressed() -> void:	
	Global.restaurar_estado_global()
	get_tree().quit()

func _on_animated_sprite_2d_2_animation_finished() -> void:
	#spriteAnimated.play_backwards("default")
	pass # Replace with function body.
