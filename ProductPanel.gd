extends Panel

var product

func _ready() -> void:
	pass # Replace with function body.
	
func init(_product): # not native _init
	product = _product

func UpdateUI(_product_name):
	$Product.text = _product_name
	
func UpdatePrice(_price):
	$Price.text = str(_price)
