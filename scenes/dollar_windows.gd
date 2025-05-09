extends Window
class_name DollarWindow


# Store the animated sprite
@export var anim_sprite:AnimatedSprite2D

# Store as a dictionary to have faster lookup to change the sprite
static var money_dict:Dictionary = {1:"one dollar", 2:"two dollar", 5:"five dollar", 10:"ten dollar", 20:"twenty dollar", 50:"fifty dollar",
									100:"one hundred dollar", 500:"five hundred dollar", 1000:"one thousand dollar", 5000:"five thousand dollar",
									10000:"ten thousand dollar", 100000:"one hundred thousand dollar"}

# Update the image and position of the window
func update_image(value:int) -> void:
	
	# Set the correct image to be the value of the bill represented
	anim_sprite.play(money_dict[value])
	
	size = anim_sprite.sprite_frames.get_frame_texture(money_dict[value], 0).get_size()

	
	
	# Get the screen that is currently active with keyboard focus
	var screen_index:int = DisplayServer.get_keyboard_focus_screen()
	
	# Get the screen position to calculate the offset
	var screen_pos = DisplayServer.screen_get_position(screen_index)
	
	# Get the total screen size of the focused screen
	var screen_size:Vector2 = DisplayServer.screen_get_size(screen_index)
	
	# Calculate the screen realestate that the bills can take up
	screen_size.x -= size.x
	screen_size.y -= size.y
	
	# Choose a random position to be at on the screen
	var x:int = randi_range(0, screen_size.x) + screen_pos.x
	var y:int = randi_range(0, screen_size.y)
	
	position = Vector2(x, y)
