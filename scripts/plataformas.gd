extends Node2D

@export var color_plataforma: String
var plataformas_neutrales: TileMapLayer
var plataformas_sol: TileMapLayer
var plataformas_luna: TileMapLayer
@export var mascara_asociada: Global.ESTADOS_MASCARA = Global.ESTADOS_MASCARA.SOL
var music2Emitter: FmodEventEmitter2D 

func _ready():
	plataformas_neutrales = $PlataformasNeutrales
	plataformas_sol = $PlataformasSol
	plataformas_luna = $PlataformasLuna
	music2Emitter = $FmodEventEmitter2D
	Global.cambio_mascara.connect(_on_cambio_mascara)


func _on_cambio_mascara(nueva_mascara: Global.ESTADOS_MASCARA):
	if nueva_mascara == Global.ESTADOS_MASCARA.LUNA:
		plataformas_sol.enabled = false
		plataformas_luna.enabled = true
	else:		
		plataformas_sol.enabled = true
		plataformas_luna.enabled = false
