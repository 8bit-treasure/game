extends Node

var load_direction : String = ''

var response
var http_node
var exits
var terrain
signal data_loaded

func _ready():
	
	response = request('https://lambda-treasure-hunt.herokuapp.com/api/adv/init/', 'METHOD_GET', {})
	yield(self, 'data_loaded')
	get_parent().get_node('Room').render()
	pass

func _request_done( result, response_code, headers, body ):
	#print('\ndone done done\n')
	var data = JSON.parse(body.get_string_from_utf8())
	print(data.result)
	exits = data.result.exits
	terrain = data.result.terrain
	self.remove_child(http_node)
	emit_signal('data_loaded')


func request(endpoint : String, method : String, body : Dictionary) -> void:
	http_node = HTTPRequest.new()
	http_node.connect('request_completed', self, '_request_done')
	self.add_child(http_node)
	http_node.set_owner(self)

	#http_node.request(endpoint)

	var data = JSON.print(body)

	var headers = [
		"Authorization: Token ac6e9fac44b48a6974eb8add0a3715184057be52",
		"Content-Type: application/json"
	]
	http_node.request(endpoint, headers, true, HTTPClient[method], data)


func move(direction : String) -> void:
	var body = {
		'direction': direction
	}
	var response = request('https://lambda-treasure-hunt.herokuapp.com/api/adv/move/', 'METHOD_POST', body)
	
	#print('request: ', direction)
	pass
