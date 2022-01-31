extends Node

var city:String = ""
var warehouse:bool = false
var products = []

func _ready() -> void:
	pass 
	
func _init(_city, _warehouse):
	city = _city
	warehouse = _warehouse
