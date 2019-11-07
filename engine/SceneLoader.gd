extends Area2D

onready var scene_info : Array = self.name.split('_')
onready var scene_name : String = scene_info[0]
onready var scene_direction : String = scene_info[1]

onready var new_scene : PackedScene = load(str('res://room/', scene_name, '.tscn'))

func _onready() -> void:
  global.load_direction = scene_direction


func _process(delta : float) -> void:
  for body in get_overlapping_bodies():
    if body.name == 'Player':
      get_tree().change_scene_to(new_scene)
      global.load_direction = scene_direction
