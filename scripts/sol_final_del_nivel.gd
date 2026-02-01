extends Area2D

func _ready():
	print("Mis grupos: ", get_groups())

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/menu_final.tscn")
