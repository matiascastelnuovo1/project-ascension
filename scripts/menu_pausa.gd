extends Node

@onready var main = get_tree().current_scene

func _on_button_continuar_pressed() -> void:
	main.hide_pause()

func _on_button_salir_pressed() -> void:
	Global.restaurar_estado_global()
	#Añadi esto porque se trababa la pausa al final
	get_tree().paused = false
	#
	get_tree().change_scene_to_file("res://scenes/juego/menu.tscn")
