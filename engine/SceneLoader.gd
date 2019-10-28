extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta : float) -> void:
	for body in get_overlapping_bodies():
		print(body.name)
		print(self.name.split('_')[0], self.name.split('_')[1])
