extends Node

signal cambio_mascara(nueva_mascara: int)
signal start_counter()

var character_position: Vector2 = Vector2(0,0)
var cruzo_cielo: bool = false
var mascaras_agarradas = 0
enum ESTADOS_MASCARA {SOL,LUNA}
var estado_mascara_actual = ESTADOS_MASCARA.SOL


func stay_in_floor():
	start_counter.emit()

func restaurar_estado_global():
	mascaras_agarradas = 0
	estado_mascara_actual = ESTADOS_MASCARA.SOL
	cruzo_cielo = false

func cambiar_mascara():
	match estado_mascara_actual:
		ESTADOS_MASCARA.SOL:
			estado_mascara_actual = ESTADOS_MASCARA.LUNA
		ESTADOS_MASCARA.LUNA:
			estado_mascara_actual = ESTADOS_MASCARA.SOL
			
	cambio_mascara.emit(estado_mascara_actual)
