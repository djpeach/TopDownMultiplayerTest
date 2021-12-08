extends Node

const DEFAULT_IP= "159.203.161.196"
const DEFAULT_PORT = 3234

var network = NetworkedMultiplayerENet.new()
var selected_IP
var selected_port

func _ready() -> void:
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func _connect_to_server():
	get_tree().connect("connected_to_server", self, "_connected_ok")
	network.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(network)

func _player_connected(id):
	print("Player {id} connected".format({"id": id}))

func _player_disconnected(id):
	print("Player {id} disconnected".format({"id": id}))

func _connected_ok():
	print("Successfully connected to server")

func _connected_fail():
	print("Failed to connect")

func _server_disconnected():
	print("Server disconnected")
