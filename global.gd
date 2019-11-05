extends Node

var load_direction : String = ''

func _ready():
	print('runs')
	var tree = get_tree().get_root().get_node('global')
	#print(tree.get_node('global'))
	var req = HTTPRequest.new()
	req.connect('request_completed', self, '_request_done')
	#tree.add_child(req)
	tree.add_child(req)
	req.set_owner(tree)
	
	req.request('http://www.mocky.io/v2/5185415ba171ea3a00704eed')
	
	print(tree.get_node('Room'))
	#print(tree.get_node('Room'))

func _request_done( result, response_code, headers, body ):
	print('\ndone done done\n')
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	#print(json.result.exits)
	#exits = json.result.exits
	#terrain = json.result.terrain
	#request.resume()
