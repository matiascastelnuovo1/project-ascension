extends Node2D

signal time_out_character()

@onready var fmod_musica_inicio_emitter: FmodEventEmitter2D = $Sonido/MusicaInicio/FmodMusicaInicioEmitter2D
@onready var fmod_musica_intermedia_emitter: FmodEventEmitter2D = $Sonido/MusicaIntermedia/FmodMusicaIntermediaEmitter2D
@onready var fmod_musica_cielo_emitter: FmodEventEmitter2D = $Sonido/MusicaCielo/FmodMusicaCieloEmitter2D
@onready var collision_inicio_shape: CollisionShape2D = $Sonido/MusicaInicio/AreaInicio2D/CollisionInicioShape2D
@onready var collision_intermedia_shape: CollisionShape2D = $Sonido/MusicaIntermedia/AreaIntermedia2D/CollisionIntermedioShape2D
@onready var collision_cielo_shape: CollisionShape2D = $Sonido/MusicaCielo/AreaCielo2D/CollisionCieloShape2D
@onready var menu_pausa: Control = $CanvasLayerMenuPausa/MenuPausa
@onready var character: CharacterBody2D = $Personajes/Personaje
@onready var timer_node: Timer = $Timers/Timer

var isTicking: bool = false

func _ready():
	character.character_not_moving.connect(handle_timer)
	character.character_moving.connect(handle_timer_stop)
	hide_pause()

func _input(event: InputEvent) -> void:	
	if Input.is_action_just_pressed("pause") or Input.is_action_just_pressed("quit"):
		show_pause()

func handle_timer():
	if not isTicking: 
		print("arranco timeout")
		isTicking = true
		timer_node.start()

func handle_timer_stop():
	if isTicking: 
		print("freno timeout")
		isTicking = false
		timer_node.stop()

func hide_pause():
	#Añado a hide_pause esta parte de codigo entre 
	get_tree().paused = false
	menu_pausa.hide()

#Añado este codigo aca para pausar el juego
func show_pause():
	get_tree().paused = true
	menu_pausa.show()

func _on_timer_timeout() -> void:
	print("tiro timeout")
	time_out_character.emit()
	pass # Replace with function body.

func _on_area_inicio_2d_body_entered(body: Node2D) -> void:
	fmod_musica_inicio_emitter.play()
	collision_inicio_shape.set_deferred("disabled", true)
	pass

func _on_area_intermedia_2d_body_entered(body: Node2D) -> void:
	fmod_musica_intermedia_emitter.play()
	fmod_musica_inicio_emitter.stop()
	collision_intermedia_shape.set_deferred("disabled", true)
	pass

func _on_area_cielo_2d_body_entered(body: Node2D) -> void:
	fmod_musica_cielo_emitter.play()
	fmod_musica_intermedia_emitter.stop()
	collision_cielo_shape.set_deferred("disabled", true)
	pass
