extends Node2D
class_name Controller

const directions : Dictionary = {
  'idle': Vector2(0, 0),
  'up': Vector2(0, -1),
  'down': Vector2(0, 1),
  'left': Vector2(-1, 0),
  'right': Vector2(1, 0),
}

var direction : Vector2 = directions.idle
export var TILE_SIZE : int


# Takes a Vector2 and returns the string representation of the vector.
func vector_direction(vector : Vector2) -> String:
  var direction_vectors : Array = directions.values()
  var direction_names : Array = directions.keys()
  var new_direction : int = direction_vectors.find(vector)

  if new_direction == -1:
    return ''

  return direction_names[new_direction]


# Handles the movement of the entity.
func movement(host, delta) -> void:
  var motion : Vector2 = direction * TILE_SIZE

  if direction != directions.idle:
    host.move_and_slide(motion / delta, Vector2(0, 0))

    # ensures that we're always snapped, otherwise can end up
    # up off the grid based on collisions
    host.position = host.position.snapped(Vector2(TILE_SIZE / 2, TILE_SIZE / 2))


