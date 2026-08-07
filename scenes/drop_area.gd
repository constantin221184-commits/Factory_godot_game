extends Area3D

@export var counted_bodies: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
			counted_bodies += 1
			print(counted_bodies)
			body.queue_free()
