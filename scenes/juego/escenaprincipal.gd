extends Node2D

@onready var fmod_musica_intermedia_emitter: FmodEventEmitter2D = $Sonido/musicaIntermedia/FmodMusicaIntermediaEmitter2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entro")
	fmod_musica_intermedia_emitter.play()
