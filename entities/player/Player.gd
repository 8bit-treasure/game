extends 'res://engine/Entity.gd'


func _ready() -> void:
  if global.load_direction == 'Right':
    position = Vector2(32, 352)

  if global.load_direction == 'Left':
    position = Vector2(1056, 352)

  if global.load_direction == 'Down':
    position = Vector2(544, 32)

  if global.load_direction == 'Up':
    position = Vector2(544, 672)


func _physics_process(delta: float) -> void:
  pass
