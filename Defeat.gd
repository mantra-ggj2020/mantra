extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var quotes = ["No sos tus pensamientos sino aquello que los percibe",
"Cae 7 veces, levantante 8",
"Todo tiene su belleza, solo que no todos lo ven",
"Haz siempre lo que te da miedo primero",
"Actua como si el fracaso fuese imposible",
"Si te gusta el durazno bancate la pelusa",
"La humanidad tiene emociones paleoliticas, instituciones medievales, y tecnologia divina"]


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Wisdom.text = quotes[rand_range(0,5)]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Retry_pressed():
	get_tree().change_scene("res://Title Screen.tscn")
	pass # Replace with function body.
