extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.restaurar_estado_global()
	get_tree().change_scene_to_file("res://scenes/juego/menu_final.tscn")
