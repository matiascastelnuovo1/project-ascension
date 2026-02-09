extends Node2D

@onready var Pieza1: Sprite2D = $Pieza1
@onready var Pieza2: Sprite2D = $Pieza2
@onready var Pieza3: Sprite2D = $Pieza3
@onready var Pieza4: Sprite2D = $Pieza4
@onready var MascaraColeccionable: Sprite2D = $MascaraColeccionable

var Pieza1Enabled: bool = false
var Pieza2Enabled: bool = false
var Pieza3Enabled: bool = false
var Pieza4Enabled: bool = false
var MascaraColeccionableEnabled: bool = false

func _process(delta: float) -> void:	
	if Global.mascara1Agarrada && not Pieza1Enabled:
		Pieza1Enabled = true	
		Pieza1.visible = true
	if Global.mascara2Agarrada && not Pieza2Enabled:
		Pieza2Enabled = true
		Pieza2.visible = true
	if Global.mascara3Agarrada && not Pieza3Enabled:
		Pieza3Enabled = true
		Pieza3.visible = true
	if Global.mascara4Agarrada && not Pieza4Enabled:
		Pieza4Enabled = true
		Pieza4.visible = true
		
	if Pieza1Enabled && Pieza2Enabled && Pieza3Enabled && Pieza4Enabled && not MascaraColeccionableEnabled:
		MascaraColeccionableEnabled = true
		MascaraColeccionable.visible = true
	pass
	
