extends Node2D

const CONDOR_SCENE: PackedScene = preload("res://scenes/condor_teledirigido.tscn")
@onready var CURRENT_SCENE = get_tree().current_scene
var CHARACTER: CharacterBody2D = null
var ESCENA_PRINCIPAL: Node2D = null
var timer: Timer = Timer.new()
var start_counter

func _ready():
	#CHARACTER = CURRENT_SCENE.find_child("Personaje")
	CURRENT_SCENE.time_out_character.connect(spawn_enemy_at_position)

func spawn_enemy_at_position():
	#print("spawneo condor")
	
	# SOLUCION 1: Verificar que CHARACTER siga siendo válido
	if not CHARACTER or not is_instance_valid(CHARACTER):
		print("ERROR: CHARACTER no válido, buscando nuevamente...")
		CHARACTER = CURRENT_SCENE.find_child("Personaje")
		if not CHARACTER:
			print("ERROR: No se encontró el personaje!")
			return
	
	# SOLUCION 2: Obtener posición ACTUAL (no la del _ready)
	var posicion_actual = CHARACTER.global_position
	print("Posición actual del personaje: ", posicion_actual)
	
	var enemy_instance = CONDOR_SCENE.instantiate()
	enemy_instance.punto_b = posicion_actual
	get_parent().add_child(enemy_instance)
	#print("CHARACTER.position", CHARACTER.position)
