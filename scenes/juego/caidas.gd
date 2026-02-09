extends Node2D
@onready var label1: Label = $Label

func _process(delta: float) -> void:
	label1.text = "Caidas: " + str(Global.caidas)
