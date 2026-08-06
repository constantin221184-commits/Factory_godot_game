extends Node3D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

var isExtended: bool = false

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
		elif isExtended:
			print("stop animation")
			animation_player.play_backwards("drill_down")
			isExtended = false
