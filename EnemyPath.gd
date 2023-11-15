extends Path3D

@export var enemy_scene: PackedScene
@onready var timer = $Timer

# connected timeout to spawn_enemy()
func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)


