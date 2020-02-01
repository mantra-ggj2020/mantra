extends Node2D

var Mantra = preload("res://Mantra.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mantras = {}

var mantraActual
var idMantra = 1
var file = File.new()
onready var timer = get_node("Timer")
onready var screen_size = get_viewport_rect().size


# Called when the node enters the scene tree for the first time.
func _ready():
	file.open("res://resources/mantras.json", file.READ)
	mantras = parse_json(file.get_as_text())
	file.close()
	generar(mantras[str(idMantra)][randi()%mantras[str(idMantra)].size()])

func generar(mantra):
	randomize()
	mantraActual = Mantra.instance();
	mantraActual.texto = mantra.texto
	mantraActual.concentracion = mantra.concentracion
	mantraActual.tiempoExp = mantra.tiempoExp
	mantraActual.position = Vector2(rand_range(300,screen_size.x-300), rand_range(300,screen_size.y-300))
	get_tree().get_root().call_deferred("add_child", mantraActual)
	timer.set_wait_time(mantra.tiempoExp)
	timer.start()
	#get_parent().add_child()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	#idMantra = idMantra + 1
	generar(mantras[str(idMantra)][randi()%mantras[str(idMantra)].size()])
