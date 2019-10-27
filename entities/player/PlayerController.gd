extends 'res://engine/Controller.gd'


func _init() -> void:
  SPEED = 70


func input() -> void:
  var left : bool = Input.is_action_pressed("ui_left")
  var right : bool = Input.is_action_pressed("ui_right")
  var up : bool = Input.is_action_pressed("ui_up")
  var down : bool = Input.is_action_pressed("ui_down")

  direction.x = -int(left) + int(right)
  direction.y = -int(up) + int(down)
