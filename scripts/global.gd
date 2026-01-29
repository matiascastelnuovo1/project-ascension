extends Node

enum ESTADO_MASCARA {VERDE,ROJO,AMARILLO}
var estado_mascara_actual = ESTADO_MASCARA.VERDE
var mascaras_agarradas = 0

func cambiar_mascara():
	match estado_mascara_actual:
		ESTADO_MASCARA.VERDE:
			estado_mascara_actual = ESTADO_MASCARA.ROJO
		ESTADO_MASCARA.ROJO:
			estado_mascara_actual = ESTADO_MASCARA.AMARILLO
		ESTADO_MASCARA.AMARILLO:
			estado_mascara_actual = ESTADO_MASCARA.VERDE
