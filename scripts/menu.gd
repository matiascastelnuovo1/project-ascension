extends Control

@onready var creditos_container: Control = $Creditos
@onready var menu_principal_container: Control = $MenuPrincipal


func _on_boton_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/juego/Escenaprincipal.tscn")
	Global.mascaras_agarradas = 0

func _on_boton_salir_pressed() -> void:
	get_tree().quit()

func _on_boton_creditos_pressed() -> void:
	menu_principal_container.visible = false
	creditos_container.visible = true


func _on_boton_volver_pressed() -> void:
	menu_principal_container.visible = true
	creditos_container.visible = false
