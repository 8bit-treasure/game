extends Controller
class_name PlayerController

onready var parent = get_parent()


func _init() -> void:
  TILE_SIZE = 64
  
  
func _ready() -> void:
  # snap parent object to grid
  parent.position = parent.position.snapped(Vector2(TILE_SIZE / 2, TILE_SIZE / 2))


func input() -> void:
  var left : bool = Input.is_action_just_pressed("ui_left")
  var right : bool = Input.is_action_just_pressed("ui_right")
  var up : bool = Input.is_action_just_pressed("ui_up")
  var down : bool = Input.is_action_just_pressed("ui_down")

  direction.y = -int(up) + int(down)
  direction.x = -int(left) + int(right)


# TODO: Implement state machine if movement gets to complex
func _physics_process(delta : float) -> void:
  input()
  movement(parent, delta)
