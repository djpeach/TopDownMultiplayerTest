extends Node

var network = NetworkedMultiplayerENet.new()
var port = 3234
var max_players = 4

func _ready():
	start_server()

func start_server():
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	
	network.connect("peer_connected", self, "_player_connected")
	network.connect("peer_disconnected", self, "_player_disconnected")
	
	print("Server started 1")

func _player_connected(player_id):
	print("Player {id} connected".format({"id": player_id}))

func _player_disconnected(player_id):
	print("Player {id} disconnected".format({"id": player_id}))
