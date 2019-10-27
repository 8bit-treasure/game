extends 'res://engine/Entity.gd'
onready var PlayerController = load('res://entities/player/PlayerController.gd').new()

# const directions : Dictionary = {
#   'idle': Vector2(0, 0),
#   'up': Vector2(0, -1),
#   'down': Vector2(0, 1),
#   'left': Vector2(-1, 0),
#   'right': Vector2(1, 0),
# }

# var direction : Vector2 = directions.idle
# var SPEED = 70

func _init() -> void:
  SPEED = 70
  direction = Vector2(0, 0)

func _physics_process(delta: float) -> void:
  #PlayerController.input()
  #PlayerController.movement()
  # var left : bool = Input.is_action_pressed("ui_left")
  # var right : bool = Input.is_action_pressed("ui_right")
  # var up : bool = Input.is_action_pressed("ui_up")
  # var down : bool = Input.is_action_pressed("ui_down")

  # direction.x = -int(left) + int(right)
  # direction.y = -int(up) + int(down)
  PlayerController.input()
  PlayerController.movement()
