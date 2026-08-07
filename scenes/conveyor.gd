extends Area3D

@onready var direction_marker_back: Marker3D = $direction_marker_back
@onready var direction_marker_front: Marker3D = $direction_marker_front

@export var speed: float = 100
var direction: Vector3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = direction_marker_front.global_position - direction_marker_back.global_position
	print(direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is RigidBody3D:
			body.rotation = Vector3(0, 0, 0)
			body.linear_velocity = direction * speed 
