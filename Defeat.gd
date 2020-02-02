extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var quotes = ["No sos tus pensamientos sino aquello que los percibe",
"Test",
"Test2"]


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Wisdom.text = quotes[rand_range(0,2)]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Retry_pressed():
	get_tree().change_scene("res://Title Screen.tscn")
	pass # Replace with function body.
