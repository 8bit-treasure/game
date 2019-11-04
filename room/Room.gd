extends Node2D

#0, 5 > -1, 5 (Left)
#8, 0 > 8, -1 (Top)
#8, 10 > 8, 11 (Bottom)
#16, 5 > 17, 5 (Right)

# From 1,1 to 15,15 lay down 

# Called when the node enters the scene tree for the first time.
func _ready():
	#$WallMap.clear()
	#var map_coords = $WallMap.world_to_map(Vector2(256, 0))
	#print(map_coords)
	#print($WallMap.get_cellv($WallMap.world_to_map(Vector2(96, 96))))
	#$WallMap.set_cellv(map_coords, 7)
	#$WallMap.set_cellv(map_coords - Vector2(0, 1), 7)
	#$WallMap.update_bitmask_region()
	#print($WallMap.tile_set.find_tile_by_name('Plains_Floor'))
	#$WallMap.set_cellv(Vector2(-1, -1), 7)
	
	$HTTPRequest.request("https://lambda-treasure-hunt.herokuapp.com/api/adv/init", ["Authorization: ac6e9fac44b48a6974eb8add0a3715184057be52"])

	for x in range(19):
		for y in range(13):
			if (x < 2 or x > 16) or (y < 2 or y > 10):
				#wall
				$WallMap.set_cellv(Vector2(x - 1, y - 1), 7)
			else:
				#grass
				$WallMap.set_cellv(Vector2(x - 1, y - 1), 8)

	$WallMap.update_bitmask_region()
