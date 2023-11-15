extends PathFollow3D

@export var speed: float = 5
@export var max_health:= 50
var current_hp: int:
	set(health_in):
		current_hp = health_in
		if (current_hp < 1):
			queue_free()
	
@onready var target = get_tree().get_first_node_in_group("base")

func _ready():
	current_hp = max_health
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	progress += (delta * speed)
	if (progress_ratio == 1.0):
		target.take_damage()
