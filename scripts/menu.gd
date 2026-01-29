extends Control

func _on_boton_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tiles_test.tscn")
	Global.mascaras_agarradas = 0

func _on_boton_salir_pressed() -> void:
	get_tree().quit()
