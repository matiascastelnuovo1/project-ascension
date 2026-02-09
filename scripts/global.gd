extends Node

signal cambio_mascara(nueva_mascara: int)

var mascaras_agarradas: int = 0
var curzo_cielo: bool = false
enum ESTADOS_MASCARA {SOL,LUNA}
var estado_mascara_actual = ESTADOS_MASCARA.SOL
var caidas: int = 0
var tiempoJuego: String = ""

var mascara1Agarrada = false	
var mascara2Agarrada = false	
var mascara3Agarrada = false	
var mascara4Agarrada = false
	
var mascaraFinalAgarrada = false	

func restaurar_estado_global():
	mascaras_agarradas = 0
	estado_mascara_actual = ESTADOS_MASCARA.SOL
	curzo_cielo = false
	caidas = 0
	tiempoJuego = ""
	mascara1Agarrada = false	
	mascara2Agarrada = false	
	mascara3Agarrada = false	
	mascara4Agarrada = false	
	mascaraFinalAgarrada = false	

func cambiar_mascara():
	match estado_mascara_actual:
		ESTADOS_MASCARA.SOL:
			estado_mascara_actual = ESTADOS_MASCARA.LUNA
		ESTADOS_MASCARA.LUNA:
			estado_mascara_actual = ESTADOS_MASCARA.SOL
			
	cambio_mascara.emit(estado_mascara_actual)
	
func agarrarMascara(piezaN: int):
	if piezaN == 1:
		mascara1Agarrada = true	
	if piezaN == 2:
		mascara2Agarrada = true
	if piezaN == 3:
		mascara3Agarrada = true
	if piezaN == 4:
		mascara4Agarrada = true
		
	if mascara1Agarrada && mascara2Agarrada && mascara3Agarrada && mascara4Agarrada:
		mascaraFinalAgarrada = true
