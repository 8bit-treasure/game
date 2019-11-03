extends StateMachine


func init() -> void:
  # need to call parent init if we override init
  .init()


func cleanup() -> void:
  # need to call parent cleanup if we override cleanup
  .cleanup()


func input(event : InputEvent) -> void:
  if controller.input():
    controller._update('move')
