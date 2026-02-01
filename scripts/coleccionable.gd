extends Area2D

@onready var collision_shape:CollisionShape2D = $CollisionShape2D
@onready var sprite_mask:Sprite2D = $Sprite2D
@onready var coleccionable_emitter: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.mascaras_agarradas += 1
		#collision_shape.disabled = true
		#sprite_mask.visible = not $Sprite2D.visible
		coleccionable_emitter.play()
		print('mascaras agarradas: ', Global.mascaras_agarradas)
		await get_tree().create_timer(0.4).timeout
		queue_free()
