extends Node2D

const CONDOR_SCENE: PackedScene = preload("res://scenes/condor_teledirigido.tscn")
@onready var CURRENT_SCENE = get_tree().current_scene
var CHARACTER: CharacterBody2D = null
var ESCENA_PRINCIPAL: Node2D = null
var timer: Timer = Timer.new()
var start_counter

func _ready():
	CHARACTER = CURRENT_SCENE.find_child("Personaje")
	CURRENT_SCENE.time_out_character.connect(spawn_enemy_at_position)

func spawn_enemy_at_position():
	print("spawneo condor")
	var enemy_instance = CONDOR_SCENE.instantiate()
	enemy_instance.punto_b = CHARACTER.position
	#revisar como corregir curva y estamos
	get_parent().add_child(enemy_instance)
	print("CHARACTER.position", CHARACTER.position)
	#enemy_instance.global_position = CHARACTER.position
