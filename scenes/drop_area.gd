extends Area3D

@export var counted_bodies: int = 0
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var delivered_items_system: Node3D = $"../../../delivered_items_system"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape_3d.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		counted_bodies += 1
		print(counted_bodies)
		delivered_items_system.update_current_items()
