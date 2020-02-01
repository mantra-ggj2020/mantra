extends Node2D

var Mantra = preload("res://Mantra.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mantras = [
{"texto": 'Om', "concentracion": 5, "tiempoExp": 7, "nivel" : 1 },
{"texto": 'Om mani', "concentracion": 5, "tiempoExp": 7, "nivel" : 1 },
{"texto": 'Shanti', "concentracion": 5, "tiempoExp": 7, "nivel" : 1 },
{"texto": 'Har Har Har', "concentracion": 5, "tiempoExp": 7, "nivel" : 2 },
{"texto": 'Sat Gure Name', "concentracion": 5, "tiempoExp": 7, "nivel" : 2 },
{"texto": 'Ad Gure Name', "concentracion": 5, "tiempoExp": 7, "nivel" : 2},
{"texto": 'Llugad Gure Name', "concentracion": 5, "tiempoExp": 7, "nivel" : 3 },
{"texto": 'Namo Amitoufo', "concentracion": 5, "tiempoExp": 7, "nivel" : 3 },
{"texto": 'Namo Amitabha Buda', "concentracion": 5, "tiempoExp": 7, "nivel" : 3 },
{"texto": 'Om Hanumate Nama', "concentracion": 5, "tiempoExp": 7, "nivel" : 4 },
{"texto": 'Siri Guru Ve Name', "concentracion": 5, "tiempoExp": 7, "nivel" : 4 },
{"texto": 'Om Namah Shivaya', "concentracion": 5, "tiempoExp": 7, "nivel" : 4 },
{"texto": 'Om mani padme hum om', "concentracion": 5, "tiempoExp": 7, "nivel" : 5 },
{"texto": 'Ong Namo Guru Dev Namo ', "concentracion": 5, "tiempoExp": 7, "nivel" : 5 },
{"texto": 'Om gam ganapataye namaha', "concentracion": 5, "tiempoExp": 7, "nivel" : 5 },
{"texto": 'Sat Patim Dehi Parameshwara', "concentracion": 5, "tiempoExp": 7, "nivel" : 6 },
{"texto": 'Om Gum Ganapatayei Namaha', "concentracion": 5, "tiempoExp": 7, "nivel" : 6 },
{"texto": 'Ap Sahae Hoa Sache Da Sacha Doa', "concentracion": 5, "tiempoExp": 7, "nivel" : 6 },
{"texto": 'Lokah Samastah Sukhino Bhavantu', "concentracion": 5, "tiempoExp": 7, "nivel" : 7 },
{"texto": 'Om Muni Muni Mahamuni Sakyamuni Svaha', "concentracion": 5, "tiempoExp": 7, "nivel" : 7 },
{"texto": 'Om Sri Ganeshaya Namaha Om Ganesha Om', "concentracion": 5, "tiempoExp": 7, "nivel" : 7 },
{"texto": 'Namo Tassa Bhagavato Arahato Samma Sambuddhassa', "concentracion": 5, "tiempoExp": 7, "nivel" : 8 },
{"texto": 'Gate Gate Paragate Parasamgate Bodhi Soha Prajna Paramita', "concentracion": 5, "tiempoExp": 7, "nivel" : 8 },
{"texto": 'Sambuddhassa Lokah Samastah Ganapatayei Mahamuni Shanti', "concentracion": 5, "tiempoExp": 7, "nivel" : 8 }
]

var mantraActual
var idMantra = 0
onready var timer = get_node("Timer")
onready var screen_size = get_viewport_rect().size


# Called when the node enters the scene tree for the first time.
func _ready():
	generar(mantras[idMantra])

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
	idMantra = idMantra + 1
	generar(mantras[idMantra])
