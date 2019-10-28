extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta : float) -> void:
	for body in get_overlapping_bodies():
		print(body.name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
