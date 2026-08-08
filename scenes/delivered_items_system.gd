extends Node3D

@onready var current_items: Label = $current_items
@onready var max_items: Label = $max_items

@onready var drop_area: Area3D = $"../ship_proto/drop_box/drop_area"
var max_items_to_deliver : int = 5
var current_items_delivered : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_text()
	


func update_current_items():
	current_items_delivered = drop_area.counted_bodies

func update_text():
	if max_items.text != str(max_items_to_deliver):
		max_items.text = str(max_items_to_deliver)
	if current_items.text != str(current_items_delivered):
		current_items.text = str(current_items_delivered)
	# text color
	if current_items_delivered >= max_items_to_deliver:
		current_items.add_theme_color_override("font_color", Color.GREEN)
	else:
		current_items.add_theme_color_override("font_color", Color.WHITE)
