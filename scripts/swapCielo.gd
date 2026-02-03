extends Node2D

@onready var fondo_luna: TileMapLayer = $FondoLuna

func _ready():
	Global.cambio_mascara.connect(_on_cambio_mascara)
	
func _on_cambio_mascara(delta):
	pass
	#if Global.estado_mascara_actual == Global.ESTADOS_MASCARA.LUNA:
		#fondo_luna.enabled = true
	#else:
		#fondo_luna.enabled = false
		
		
