extends Node2D

const CONDOR_SCENE: PackedScene = preload("res://scenes/condor.tscn")
@onready var CURRENT_SCENE = get_tree().current_scene
var CHARACTER: CharacterBody2D = null
var timer: Timer = Timer.new()
var start_counter
var counter_is_running:bool = false

# ESTA CASI LISTO, HAY QUE LOGRAR RECIBIR EL PERSONAJE PERO PODEMOS PROBARLO
# DE A POCO. TODO DEBERIA ESTAR INTEGRADO PERO PROBAR IGUAL

func _ready():
	CHARACTER = CURRENT_SCENE.get_node_or_null("Personaje/Personaje")
	print("Character", CHARACTER)
	Global.start_counter.connect(timer_tick)
	
	add_child(timer) # Add it to the scene tree
	timer.wait_time = 3.0
	timer.one_shot = true
	# Connect the timeout signal to a function
	timer.timeout.connect(spawn_enemy_at_position)
	timer.start()
	
func timer_tick():
	if not counter_is_running:
		timer.start(3)	
		counter_is_running = true

func spawn_enemy_at_position():
	var enemy_instance = CONDOR_SCENE.instantiate()
	get_parent().add_child(enemy_instance)
	#enemy_instance.global_position = CHARACTER.position
	counter_is_running = false
	queue_free()
