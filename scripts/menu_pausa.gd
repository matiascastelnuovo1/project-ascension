extends Node

@onready var main = $"../../../.."

func _on_button_continuar_pressed() -> void:
	main.hide_pause()

func _on_button_salir_pressed() -> void:
	Global.restaurar_estado_global()
	get_tree().change_scene_to_file("res://scenes/juego/menu.tscn")
