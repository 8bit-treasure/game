extends Node

var load_direction : String = ''

var response
var exits
var terrain

func _ready():
	#print('runs')
	#var tree = get_tree().get_root().get_node('global')
	#print(tree.get_node('global'))
	#var req = HTTPRequest.new()
	#req.connect('request_completed', self, '_request_done')
	#tree.add_child(req)
	#tree.add_child(req)
	#req.set_owner(tree)
	
	#req.request('http://www.mocky.io/v2/5185415ba171ea3a00704eed')
	
	#print(tree.get_node('Room'))
	#print(tree.get_node('Room'))
	pass

func _request_done( result, response_code, headers, body ):
	#print('\ndone done done\n')
	var data = JSON.parse(body.get_string_from_utf8())
	print(data.result)
	#print(json.result.exits)
	#exits = json.result.exits
	#terrain = json.result.terrain
	#request.resume()
	#response.resume()
	
	# set room data to global variables
	exits = data.result.exits
	terrain = data.result.terrain


func request(endpoint : String, direction : String) -> void:
	var tree = get_tree().get_root().get_node('global')
	var http_node = HTTPRequest.new()
	http_node.connect('request_completed', self, '_request_done')
	tree.add_child(http_node)
	http_node.set_owner(tree)

	#http_node.request(endpoint)

	var data = JSON.print({
		'direction': direction
	})

	var headers = [
		"Authorization: Token ac6e9fac44b48a6974eb8add0a3715184057be52",
		"Content-Type: application/json"
	]
	http_node.request(endpoint, headers, true, HTTPClient.METHOD_POST, data)
	#yield()
	
	


func move(direction : String) -> void:
	var response = request('https://lambda-treasure-hunt.herokuapp.com/api/adv/move/', direction)
	
	#print('request: ', direction)
	pass
