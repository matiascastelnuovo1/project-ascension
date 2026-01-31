extends Node2D

@onready var fmod_musica_inicio_emitter: FmodEventEmitter2D = $Sonido/MusicaInicio/FmodMusicaInicioEmitter2D
@onready var fmod_musica_intermedia_emitter: FmodEventEmitter2D = $Sonido/MusicaIntermedia/FmodMusicaIntermediaEmitter2D
@onready var fmod_musica_cielo_emitter: FmodEventEmitter2D = $Sonido/MusicaCielo/FmodMusicaCieloEmitter2D
@onready var collision_inicio_shape: CollisionShape2D = $Sonido/MusicaInicio/AreaInicio2D/CollisionInicioShape2D
@onready var collision_intermedia_shape: CollisionShape2D = $Sonido/MusicaIntermedia/AreaIntermedia2D/CollisionIntermedioShape2D
@onready var collision_cielo_shape: CollisionShape2D = $Sonido/usicaCielo/AreaCielo2D/CollisionCieloShape2D

func _on_area_inicio_2d_body_entered(body: Node2D) -> void:
	print("entro inicio")
	fmod_musica_inicio_emitter.play()
	collision_inicio_shape.set_deferred("disabled", true)
	pass

func _on_area_intermedia_2d_body_entered(body: Node2D) -> void:
	print("entro intermedio")
	fmod_musica_intermedia_emitter.play()
	fmod_musica_inicio_emitter.stop()
	collision_intermedia_shape.set_deferred("disabled", true)
	pass

func _on_area_cielo_2d_body_entered(body: Node2D) -> void:
	#print("entro cielo")
	fmod_musica_cielo_emitter.play()
	fmod_musica_intermedia_emitter.stop()
	collision_cielo_shape.set_deferred("disabled", true)
	pass
