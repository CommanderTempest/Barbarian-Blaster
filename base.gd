extends Node3D

@export var max_health: int = 5
@onready var label_3d = $Label3D
var current_health: int:
	set(health_in):
		current_health = health_in
		label_3d.text = str(current_health)
		if (current_health < 1):
			get_tree().reload_current_scene()
	get:
		return current_health
func _ready():
	# will automatically call setter
	current_health = max_health

func take_damage() -> void:
	# will automatically call setter
	current_health -= 1
