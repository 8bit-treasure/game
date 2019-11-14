extends StateMachine

var tick_counter = 0;
# Loading state
# automatically moves character
# does not accept input
# var target : Vector2 = Vector2(544, 352)
var target : Vector2 = Vector2(480, 352)
func physics_process(delta : float) -> void:
  tick_counter += 1
  print(global.load_direction.to_lower())
  print(get_tree().current_scene.name)

  if (get_tree().current_scene.name == 'Room'):
    controller._update('idle')

  # print(controller.entity.position)
  # controller.set_direction('right')
  # controller.move(delta)
  if tick_counter == 20:
    if not controller.move_to(delta, target, global.load_direction.to_lower()):
      controller._update('idle')
    tick_counter = 0
    # controller._update('idle')

# var toggle = false
# func funky():
  # if toggle:
