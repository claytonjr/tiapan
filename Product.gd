extends Node

var product:String = ""
var min_price:int = 0
var max_price:int = 0

var product_panel = null 

func _ready() -> void:
	pass 
	
func _init(_product, _min_price, _max_price) -> void:
	product = _product
	min_price = _min_price
	max_price = _max_price
	
func CalculatePrice():
	randomize()
	return int(rand_range(min_price, max_price))
