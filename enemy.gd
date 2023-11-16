extends PathFollow3D

@export var speed: float = 5
@export var max_health:= 50
@export var gold_reward:= 15
@onready var bank = get_tree().get_first_node_in_group("bank")

var current_hp: int:
	set(health_in):
		if (health_in < current_hp):
			animation_player.play("TakeDamage")
		current_hp = health_in
		if (current_hp < 1):
			bank.gold += gold_reward
			queue_free()
	
@onready var target = get_tree().get_first_node_in_group("base")
@onready var animation_player = $AnimationPlayer

func _ready():
	current_hp = max_health
	#Game runs twice as fast:
	#Engine.time_scale = 2
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	progress += (delta * speed)
	if (progress_ratio == 1.0):
		target.take_damage()
		set_process(false)
		queue_free()
