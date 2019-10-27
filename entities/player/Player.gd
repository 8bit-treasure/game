extends 'res://engine/Entity.gd'
onready var PlayerController = load('res://engine/PlayerController.gd').new()


func _ready():
  PlayerController.do_things()
  
