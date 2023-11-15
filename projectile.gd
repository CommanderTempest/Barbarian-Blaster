extends Area3D

# :/ also sets the type it needs to be
var direction:= Vector3.FORWARD

@export var damage:= 25
@export var speed:= 30.0

func _physics_process(delta):
	position = position + direction * speed * delta
	
func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("enemy_area"):
		area.get_parent().current_hp -= damage
		queue_free()
