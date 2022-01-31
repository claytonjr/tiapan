extends Node

var city = null
var product = null 
var price = null 

func _ready() -> void:
	pass 
	
func _init(_city, _product) -> void:
	city = _city
	product = _product
	price = _product.CalculatePrice() # this gon break yo 
	
func RandomPrice():
	price = product.CalculatePrice()
