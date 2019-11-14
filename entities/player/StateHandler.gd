extends Controller
class_name StateHandler

var states : Dictionary
var state : Node2D
var scene : Node2D

func _ready() -> void:
  # TODO: look for a way to handle this
  states = {
    'idle': $Idle,
    'move': $Move,
    'loading': $Loading,
  }

  state = states['idle']
  state.set_active(true)
  scene = get_parent()


func _update(new_state : String) -> void:
  state.cleanup()
  state = states[new_state]
  state.init()


# handle all tick processes here in the state handler
func _physics_process(delta : float) -> void:
  state.physics_process(delta)


func _process(delta : float) -> void:
  state.process(delta)


func _input(event : InputEvent) -> void:
  state.input(event)
