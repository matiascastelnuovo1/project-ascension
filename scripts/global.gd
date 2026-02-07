extends Node

signal cambio_mascara(nueva_mascara: int)

var mascaras_agarradas: int = 0
var curzo_cielo: bool = false
enum ESTADOS_MASCARA {SOL,LUNA}
var estado_mascara_actual = ESTADOS_MASCARA.SOL

func restaurar_estado_global():
	mascaras_agarradas = 0
	estado_mascara_actual = ESTADOS_MASCARA.SOL

func cambiar_mascara():
	match estado_mascara_actual:
		ESTADOS_MASCARA.SOL:
			estado_mascara_actual = ESTADOS_MASCARA.LUNA
		ESTADOS_MASCARA.LUNA:
			estado_mascara_actual = ESTADOS_MASCARA.SOL
			
	cambio_mascara.emit(estado_mascara_actual)
