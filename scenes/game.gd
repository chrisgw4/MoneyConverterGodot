extends Node2D


var amount_of_money:int = 0

# Get the window instance at start up so its faster to instantiate
@onready var window_instance:PackedScene = preload("res://scenes/DollarWindows.tscn")

# Get the text edit node to get the input value
@onready var text_edit:TextEdit = $CenterContainer/TextEdit

# Get the window holder node so we can add new Window Instances to it
@onready var window_holder:Node2D = $"Window Holder"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# When the start button is pressed, start the calculation
func _on_button_pressed() -> void:
	pass # Replace with function body.
	
	# Check if the input text is a valid integer
	if text_edit.text.is_valid_int():
		# Set the amount of money to the input number
		amount_of_money = int(text_edit.text)
		
		# Calculate each bill from largest to smallest
		calculate_value(100000)
		calculate_value(10000)
		calculate_value(5000)
		calculate_value(1000)
		calculate_value(500)
		calculate_value(100)
		calculate_value(50)
		calculate_value(20)
		calculate_value(10)
		calculate_value(5)
		calculate_value(2)
		calculate_value(1)
		
		

# Calculates the amount of bills based on the input cost amount
func calculate_value(cost_amount:int):
	
	# If the amount of money left is less than the cost amount then there are 0 bills of that amount
	if amount_of_money < cost_amount:
		return
	
	# The amount of bills
	var temp:int = int(amount_of_money / cost_amount)
	
	# Take away the amount of bills * cost amount from the amount of money
	amount_of_money -= temp * cost_amount
	
	# Go through the range of the number of bills and create a custom window for each one
	for i in range(temp):
		var temp2:DollarWindow = window_instance.instantiate()
		temp2.update_image(cost_amount)
		window_holder.add_child(temp2)
	
	
