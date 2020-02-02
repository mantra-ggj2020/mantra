extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var multiplicador = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	$Gong.play()
	pass # Replace with function body.
	
func _unfocused():
	pass
	
func _si(concentracion):
	get_node("Meditador")._ascend(concentracion*multiplicador)
	get_node("Progreso")._focus(concentracion)
	$Levelup.play()
	
func _no(concentracion):
	get_node("Meditador")._descend(concentracion*multiplicador)
	get_node("Progreso")._focus(-concentracion)
	$Leveldown.play()


###PUNTOS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
