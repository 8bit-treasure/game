extends StateMachine


func physics_process(delta : float) -> void:
  controller.move(delta)
  controller._update('idle')
