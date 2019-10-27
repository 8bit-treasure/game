extends Controller
class_name PlayerController



func _init() -> void:
  TILE_SIZE = 32
  
  
func _ready() -> void:
  # get parent object we are controlling and snap to grid
  var parent = get_parent()
  parent.position = parent.position.snapped(Vector2(TILE_SIZE, TILE_SIZE))


func input() -> void:
  var left : bool = Input.is_action_just_pressed("ui_left")
  var right : bool = Input.is_action_just_pressed("ui_right")
  var up : bool = Input.is_action_just_pressed("ui_up")
  var down : bool = Input.is_action_just_pressed("ui_down")

  direction.y = -int(up) + int(down)
  direction.x = -int(left) + int(right)


# TODO: Implement state machine if movement gets to complicated
func _physics_process(delta : float) -> void:
  input()
  movement(get_parent(), delta)
