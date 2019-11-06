extends Node2D
#var request
#var exits
#var terrain

onready var tiles = {
	'CAVE_Floor': $WallMap.tile_set.find_tile_by_name('Caves_Floor'),
	'CAVE_Wall': $WallMap.tile_set.find_tile_by_name('Caves_Wall'),
	'Mountain_Floor': $WallMap.tile_set.find_tile_by_name('Mountain_Floor'),
	'Mountain_Wall': $WallMap.tile_set.find_tile_by_name('Mountain_Wall'),
	'NORMAL_Floor': $WallMap.tile_set.find_tile_by_name('Plains_Floor'),
	'NORMAL_Wall': $WallMap.tile_set.find_tile_by_name('Plains_Wall'),
	'Start-Shop_Floor': $WallMap.tile_set.find_tile_by_name('Start-Shop_Floor'),
	'Start-Shop_Wall': $WallMap.tile_set.find_tile_by_name('Start-Shop_Wall')
}

var exit_tiles = {
	'w': [Vector2(0, 5), Vector2(-1, 5)],
	'n': [Vector2(8, 0), Vector2(8, -1)],
	's': [Vector2(8, 10), Vector2(8, 11)],
	'e': [Vector2(16, 5), Vector2(17, 5)],
}

# From 1,1 to 15,15 lay down 

func get_data():
#	$HTTPRequest.request("https://lambda-treasure-hunt.herokuapp.com/api/adv/init", ["Authorization: Token ac6e9fac44b48a6974eb8add0a3715184057be52"])
#	yield()
#	for x in range(19):
#		for y in range(13):
#			if (x < 2 or x > 16) or (y < 2 or y > 10):
				#wall
#				$WallMap.set_cellv(Vector2(x - 1, y - 1), tiles[terrain + '_Wall'])
#			else:
#				#grass
#				$WallMap.set_cellv(Vector2(x - 1, y - 1), tiles[terrain + '_Floor'])
	
#	for exit in exits:
#		for tile in exit_tiles[exit]:
#			$WallMap.set_cellv(tile, tiles[terrain + '_Floor'])

#	$WallMap.update_bitmask_region()
	pass

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
	
	#get_data()
	#request = get_data()
	#data.resume()
	#print('resumed')
	if global.terrain:
		for x in range(19):
			for y in range(13):
				if (x < 2 or x > 16) or (y < 2 or y > 10):
					#wall
					$WallMap.set_cellv(Vector2(x - 1, y - 1), tiles[global.terrain + '_Wall'])
				else:
					#grass
					$WallMap.set_cellv(Vector2(x - 1, y - 1), tiles[global.terrain + '_Floor'])
		
		for exit in global.exits:
			for tile in exit_tiles[exit]:
				$WallMap.set_cellv(tile, tiles[global.terrain + '_Floor'])
	
		$WallMap.update_bitmask_region()


#func _on_HTTPRequest_request_completed( result, response_code, headers, body ):
#	var json = JSON.parse(body.get_string_from_utf8())
#	print(json.result)
#	#print(json.result.exits)
#	exits = json.result.exits
#	terrain = json.result.terrain
#	request.resume()
