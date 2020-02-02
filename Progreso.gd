extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var focusbar = 50
var soullink = 0
var level = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _focus(concentracion):
	focusbar += concentracion
	if concentracion > 0:
			soullink +=1
	_checkLink()
	

func _checkLink():
	if focusbar == 0:
		_drop()
	if soullink == 2:
		soullink = 0
		level += 1
		get_parent().get_node("Generamantra").nivel = level
		print("levelup! now level:" + str(level) )
		get_parent().get_node("Meditador")._evolve(level)
			
	pass	

func _drop():
	 get_parent().get_node("Meditador")._fall()
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
