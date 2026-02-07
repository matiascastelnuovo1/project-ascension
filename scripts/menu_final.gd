extends Node2D

var tween: Tween
@onready var currentLabel = $MenuPrincipal/TextoFinal
@export var duration: float = 0.8

func _ready() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween()
	tween.tween_property(currentLabel, "visible_characters", 120, duration)


func _on_boton_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/juego/menu.tscn")

func _on_boton_salir_pressed() -> void:
	get_tree().quit()
