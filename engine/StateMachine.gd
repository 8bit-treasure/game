extends Node2D
class_name StateMachine

var controller : Node2D


func _init() -> void:
  pass


func _ready() -> void:
  # disable initial tick processes
  set_active(false)

  controller = get_parent()


func init() -> void:
  # enable tick processes
  set_active(true)

  # add any other state initialization here
  print('Enabling: ', self.name)


func cleanup() -> void:
  # disable tick processes
  set_active(false)

  # add any other state cleanup here
  print('Disabling: ', self.name)


func physics_process(delta : float) -> void:
  pass


func process(delta : float) -> void:
  pass


func input(event : InputEvent) -> void:
  pass


func set_active(boolean : bool) -> void:
  set_physics_process(boolean)
  set_process_input(boolean)
  set_process(boolean)
