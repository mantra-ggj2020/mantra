extends Node2D
var sad_monk = preload("res://Resources/monk_sad.png")
var zen_monk = preload("res://Resources/monk_zen.png")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 20
onready var tween = get_node("Tween")
onready var sprite = get_node("Sprite")
#onready var meditador = get_parent();

signal fallen
signal win

# Called when the node enters the scene tree for the first time.
func _ready():
	#_move(100)
	#var tween = get_node("Tween")
	pass # Replace with function body.
	
func _process(_delta):
	pass
	


	
func _ascend(focusvalue):
	_move(-focusvalue)
	pass
	
func _move(focusvalue):
	tween.interpolate_property(self, "position",
		self.position , Vector2(self.position.x, self.position.y + focusvalue), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	
func _descend(focusvalue):
	_move(focusvalue)
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AscendButton_pressed():
	_ascend(100)
	pass # Replace with function body.


func _on_DescendButton_pressed():
	_descend(100)
	pass # Replace with function body.


func _on_Culo_area_entered(_area):
	print("ping")
	sprite.set_texture(sad_monk)
	tween.stop_all()
	emit_signal("fallen")
	pass # Replace with function body.
	
func _fall():
	_descend(1000)
	pass
	
func _evolve(level):
	#$Particulas.color_ramp = load("res://color_lvl"+str(level)+".tres")
	print(Vector3(0.05*(level-1)+0.2, 50*(level-1), (1.0/6.0)*(level-1)))
	$Particulas.speed_scale = 0.05*(level-1)+0.2
	$Particulas.angular_velocity = 50*(level-1)
	$Particulas.hue_variation = float((1.0/6.0)*(level-1))
	$Particulas.scale_amount_random = 0.1*(level-1)+0.4
#	if level == 1:
#		$Particulas.initial_velocity = 100
#		$Particulas.orbit_velocity = 0
#	if level == 2:
#		$Particulas.initial_velocity = 120
#		$Particulas.orbit_velocity = 0.15
	if level>=4:
		$Sprite.set_texture(zen_monk)
		if level >= 6:
			$Flash.emitting = true
	if level == 8:
		emit_signal("win")
	
