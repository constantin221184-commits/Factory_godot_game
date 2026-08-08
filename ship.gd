extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var drop_box = preload("res://scenes/drop_box.tscn")
var spawned: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func spawnShip() -> void:
	#animation_player.play("spawn")
	
