extends Node

var mascaras_agarradas = 0
enum ESTADO_MASCARA {SOL,LUNA}
var estado_mascara_actual = ESTADO_MASCARA.SOL

func cambiar_mascara():
	match estado_mascara_actual:
		ESTADO_MASCARA.SOL:
			estado_mascara_actual = ESTADO_MASCARA.LUNA
		ESTADO_MASCARA.LUNA:
			estado_mascara_actual = ESTADO_MASCARA.SOL
