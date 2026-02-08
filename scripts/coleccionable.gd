extends Area2D

@onready var collision_shape:CollisionShape2D = $CollisionShape2D
@onready var sprite_mask:Sprite2D = $Sprite2D
@onready var coleccionable_emitter: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		coleccionable_emitter.play()
		Global.mascaras_agarradas += 1
		match self.name:
			"Coleccionable1":
				Global.mascara1Agarrada = true
			"Coleccionable2":
				Global.mascara2Agarrada = true
			"Coleccionable3":
				Global.mascara3Agarrada = true
			"Coleccionable4":
				Global.mascara4Agarrada = true
				
		print("Some other number")
		await get_tree().create_timer(0.4).timeout
		queue_free()
