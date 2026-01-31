extends Node2D

@onready var fmod_musica_inicio_emitter: FmodEventEmitter2D = $Sonido/musicaInicio/FmodMusicaInicioEmitter2D
@onready var fmod_musica_intermedia_emitter: FmodEventEmitter2D = $Sonido/musicaIntermedia/FmodMusicaIntermediaEmitter2D
@onready var fmod_musica_cielo_emitter: FmodEventEmitter2D = $Sonido/musicaCielo/FmodMusicaCieloEmitter2D

func _on_area_inicio_2d_body_entered(body: Node2D) -> void:
	fmod_musica_inicio_emitter.play()
	pass

func _on_area_intermedia_2d_body_entered(body: Node2D) -> void:
	fmod_musica_intermedia_emitter.play()
	pass

func _on_area_cielo_2d_body_entered(body: Node2D) -> void:
	fmod_musica_cielo_emitter.play()
	pass
