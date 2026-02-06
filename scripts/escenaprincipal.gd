extends Node2D

@onready var fmod_musica_inicio_emitter: FmodEventEmitter2D = $Sonido/MusicaInicio/FmodMusicaInicioEmitter2D
@onready var fmod_musica_intermedia_emitter: FmodEventEmitter2D = $Sonido/MusicaIntermedia/FmodMusicaIntermediaEmitter2D
@onready var fmod_musica_cielo_emitter: FmodEventEmitter2D = $Sonido/MusicaCielo/FmodMusicaCieloEmitter2D
@onready var collision_inicio_shape: CollisionShape2D = $Sonido/MusicaInicio/AreaInicio2D/CollisionInicioShape2D
@onready var collision_intermedia_shape: CollisionShape2D = $Sonido/MusicaIntermedia/AreaIntermedia2D/CollisionIntermedioShape2D
@onready var collision_cielo_shape: CollisionShape2D = $Sonido/MusicaCielo/AreaCielo2D/CollisionCieloShape2D
# Agregue esto entre los corchetes
@onready var menu_pausa = $CanvasLayerMenuPausa/MenuPausa

func _ready():
	hide_pause()

func _input(event: InputEvent) -> void:	
	#Agregue esta funcion para pausar el juego
	if Input.is_action_just_pressed("pause"):
		show_pause()
	#
	if Input.is_action_just_pressed("quit"):		
		#Saque este codigo de aca y lo reemplace por otro
		#get_tree().change_scene_to_file("res://scenes/juego/menu.tscn")
		show_pause()

func hide_pause():
	#Añado a hide_pause esta parte de codigo entre 
	get_tree().paused = false
	menu_pausa.hide()

#Añado este codigo aca para pausar el juego
func show_pause():
	get_tree().paused = true
	menu_pausa.show()

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
	Global.cruzo_cielo = true

#
