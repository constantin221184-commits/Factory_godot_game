extends Node3D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var spawn_position: Node3D = $spawnPosition


var isExtended: bool = false


@export var raw_iron = preload("res://scenes/raw_iron.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Dust_Particles3D.emitting = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	toggleAnimation()
	

func toggleAnimation() -> void:
	if Input.is_action_just_pressed("interact"):
		if !isExtended:
			print("play animation")
			animation_player.play("drill_down")
			isExtended = true
			timer.start()

		elif isExtended:
			print("stop animation")
			animation_player.play_backwards("drill_down")
			isExtended = false


func _on_timer_timeout() -> void:
	if isExtended:
		spawn_raw_iron()

func spawn_raw_iron() -> void:
	var obj = raw_iron.instantiate()
	get_tree().current_scene.add_child(obj)
	obj.global_position = to_global(spawn_position.position)
