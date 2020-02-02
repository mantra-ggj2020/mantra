extends HBoxContainer

var texto = "Start"
var idxLetra = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	get_node("Startext").bbcode_text = ' '+texto
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed:
		var s = OS.get_scancode_string( event.scancode )
		if s == 'Space':
			s = ' '
#		self.inputstr = str(self.inputstr) + s
##		print(inputstr)
#		if inputstr.to_lower().similarity(texto.to_lower()) > 0:
#			get_node("TextoTipeado").text = inputstr.to_lower()
#		if texto.to_lower() in inputstr.to_lower():
#			completa()
		if texto[idxLetra].to_upper() == s.to_upper():
			get_node("Startext").bbcode_text = ' [color=#00EE00][tornado radius=5 freq=5]'+texto.substr(0,idxLetra+1)+'[/tornado][/color]'+texto.substr(idxLetra+1)
			idxLetra = idxLetra + 1
			if idxLetra == texto.length():
				get_tree().change_scene("res://main.tscn")
		elif (s.to_upper() >= 'A' and s.to_upper() <= 'Z') or s == ' ':
			get_node("Startext").bbcode_text = ' [color=red]'+texto.substr(0,idxLetra)+'[/color]'+texto.substr(idxLetra)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.


func _on_Creditos_pressed():
	get_tree().change_scene("res:/Creditos.tscn")
	pass # Replace with function body.
