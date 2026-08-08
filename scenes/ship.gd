extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var drop_box = preload("res://scenes/drop_box.tscn")
@onready var collision_shape_3d: CollisionShape3D = $ship_proto/drop_box/drop_area/CollisionShape3D
@onready var drop_area: Area3D = $ship_proto/drop_box/drop_area
@onready var delivered_items_system: Node3D = $delivered_items_system



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func spawnShip() -> void:
	print("Spawn Ship!")
	animation_player.play("spawn")
	collision_shape_3d.disabled = false
	
func de_spawnShip() -> void:
	print("Despawn Ship!")
	animation_player.play("despawn")
	collision_shape_3d.disabled = true
	drop_area.counted_bodies = 0
	delivered_items_system.update_current_items()
