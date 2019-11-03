extends Node2D
class_name Controller

export var TILE_SIZE : int = 64
var HALF_TILE : int

const directions : Dictionary = {
  'idle': Vector2(0, 0),
  'up': Vector2(0, -1),
  'down': Vector2(0, 1),
  'left': Vector2(-1, 0),
  'right': Vector2(1, 0),
}

var direction : Vector2 = directions.idle
var entity : KinematicBody2D


func _ready() -> void:
  entity = get_parent()
  HALF_TILE = TILE_SIZE / 2
  entity.position = entity.position.snapped(Vector2(HALF_TILE, HALF_TILE))


# handles input for the entity
func input() -> bool:
  var left : bool = Input.is_action_just_pressed("ui_left")
  var right : bool = Input.is_action_just_pressed("ui_right")
  var up : bool = Input.is_action_just_pressed("ui_up")
  var down : bool = Input.is_action_just_pressed("ui_down")

  direction.y = -int(up) + int(down)
  direction.x = -int(left) + int(right)

  if direction != directions.idle:
    return true
  
  return false


# handles the movement of the entity
func move(delta : float) -> void:
  var velocity : Vector2 = direction * TILE_SIZE

  if direction != directions.idle:
    entity.move_and_slide(velocity / delta, Vector2(0, 0))

    # ensures that we're always snapped, otherwise can end up
    # up off the grid based on collisions
    entity.position = entity.position.snapped(Vector2(HALF_TILE, HALF_TILE))


func set_direction(new_direction : String) -> Vector2:
  direction = directions[new_direction]
  return direction


func get_direction() -> String:
  return vector_direction(direction)


# takes a Vector2 and returns the string representation of the vector.
func vector_direction(vector : Vector2) -> String:
  var direction_vectors : Array = directions.values()
  var direction_names : Array = directions.keys()
  var new_direction : int = direction_vectors.find(vector)

  if new_direction == -1:
    return ''

  return direction_names[new_direction]
