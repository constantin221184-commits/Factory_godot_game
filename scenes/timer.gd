extends Timer

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var ship: Node3D = $".."

@onready var label: Label = $"../Label"
@export var value : int = 10
var saved_value := 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(value)
	saved_value = value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timeout() -> void:
	if value != 0:
		value -= 1
		label.text = str(value)
	else:
		print("Spawn Ship!")
		ship.spawnShip()
		value = saved_value +1 
