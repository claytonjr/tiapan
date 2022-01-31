extends Panel

var cash:int  = 250
var firm:String = "Noble House"

var city = preload("res://City.gd")
var product = preload("res://Product.gd")
var city_product = preload("res://CityProduct.gd")
var product_panel = preload("res://ProductPanel.tscn")

var cities = []
var current_city = 0
var products = []
var city_products = []

var city_data = [
	{
		"city":  "Hong Kong",
		"warehouse": true
	},
	{
		"city": "Shanghai",
		"warehouse": true
	},
	{
		"city": "Nagasaki",
		"warehouse": true
	},
	{
		"city": "Manila",
		"warehouse": true
	}
]

var product_data = [
	{
		"product": "General Goods",
		"min_price": 3,
		"max_price": 25
	},
	{
		"product": "Arms",
		"min_price": 5,
		"max_price": 30
	},
	{
		"product": "Silk",
		"min_price": 500,
		"max_price": 1000
	},
	{
		"product": "Opium",
		"min_price": 1000,
		"max_price": 5000
	}
]

func _ready() -> void:
	$ProductListContainer.add_constant_override("separation", 20)
	CreateProducts()
	CreateProductPanels()
	CreateCities()
	CreateCityProducts()
	PrintCityProducts()
	ArriveAtPort()
	UpdateUI()
	
func CreateProducts():
	for _product in product_data:
		var __product = product.new(_product.product, _product.min_price, _product.max_price)
		products.append(__product)
	
func CreateCities():
	for _city in city_data:
		var __city = city.new(_city.city, _city.warehouse)
		cities.append(__city)
		print("_city.name: %s, __city.name: %s" % [_city.city, __city.city])

	for _c in cities:
		print("City: %s" % [_c.city])
	
func CreateCityProducts():
	for _city in cities:
		for _product in products:
			var _city_product = city_product.new(_city, _product)
			_city.products.append(_city_product)

func PrintCityProducts():
	for _city in cities:
		for _city_product in _city.products:
			print("City: %s, Product: %s, Price: %s" % [_city_product.city.city, _city_product.product.product, _city_product.price])

func ArriveAtPort():	
	for _city_product in cities[current_city].products:
		if randf() > 0.5:
			randomize()
			_city_product.RandomPrice() 
		_city_product.product.product_panel.UpdatePrice(_city_product.price)

func DepartFromPort(_new_city):
	if _new_city != current_city:
		current_city = _new_city
		# check for pirates
		ArriveAtPort()
		UpdateUI()
	else:
		print("You are already here!")
			
func CreateProductPanels():
	for _product in products:
		var _product_panel = product_panel.instance()
		_product.product_panel = _product_panel
		_product_panel.init(_product)
		_product_panel.UpdateUI(_product.product)
		$ProductListContainer.add_child(_product_panel)

func UpdateUI():
	$lblFirm.text = firm
	$lblCash.text = "Cash: " + str(cash)
	$lblCity.text = "City: " + str(cities[current_city].city)

func _on_btnShanghai_pressed() -> void:
	current_city = 1
	ArriveAtPort()
	UpdateUI()

func _on_btnHongKong_pressed() -> void:
	current_city = 0
	ArriveAtPort()
	UpdateUI()

func _on_btnNagasaki_pressed() -> void:
	current_city = 2
	ArriveAtPort()
	UpdateUI()
