extends Area3D

@onready var direction_marker_back: Marker3D = $direction_marker_back
@onready var direction_marker_front: Marker3D = $direction_marker_front
@export var centering_strength: float = 5.0
var right_axis: Vector3 

@export var speed: float = 100
var direction: Vector3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = (direction_marker_front.global_position - direction_marker_back.global_position).normalized()
	print(direction)
	right_axis = direction.cross(Vector3.UP).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body is RigidBody3D:
			body.axis_lock_angular_x = true
			body.axis_lock_angular_y = true
			body.axis_lock_angular_z = true
			
			var to_body = body.global_position - global_position
			var lateral_offset = to_body.dot(right_axis)
			
			var correction = -right_axis * lateral_offset * centering_strength
			body.linear_velocity = direction.normalized() * speed + correction
