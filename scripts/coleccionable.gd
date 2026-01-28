extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pers_jugable"): # Replace with function body.
		Global.mascaras_agarradas += 1
		queue_free()
