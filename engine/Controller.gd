extends KinematicBody2D


const directions : Dictionary = {
  'idle': Vector2(0, 0),
  'up': Vector2(0, -1),
  'down': Vector2(0, 1),
  'left': Vector2(-1, 0),
  'right': Vector2(1, 0),
}

var direction : Vector2 = directions.idle
var SPEED : int


# Takes a Vector2 and returns the string representation of the vector.
func vector_direction(vector : Vector2) -> String:
  var direction_vectors : Array = directions.values()
  var direction_names : Array = directions.keys()
  var new_direction : int = direction_vectors.find(direction)

  if new_direction == -1:
    return ''

  return direction_names[new_direction]


# Handles the movement of the entity.
func movement() -> void:
  var motion : Vector2 = direction.normalized() * SPEED
  move_and_slide(motion, Vector2(0, 0))
