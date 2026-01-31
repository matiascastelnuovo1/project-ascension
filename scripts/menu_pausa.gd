extends Node

func _ready():
	get_tree().paused = false
	$VBoxContainer.visible = false
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().paused = not get_tree().paused
		$VBoxContainer.visible = not $VBoxContainer.visible

func _on_button_continuar_pressed() -> void:
	get_tree().paused = false
	$VBoxContainer.visible = false

func _on_button_salir_pressed() -> void:
	get_tree().paused = false
	$VBoxContainer.visible = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	Global.mascaras_agarradas = 0
