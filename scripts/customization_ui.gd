extends Control
@onready var player = $"../../Player"
var selected_top : int = 0
var selected_bottom : int = 0
var selected_shoes : int = 0

var top_options : Array = ["none", "pink_top", "black_top"]
var bottom_options : Array = ["none", "light_blue_bottom", "dark_blue_bottom"]
var shoes_options : Array = ["none", "red_shoes", "black_shoes"]

func _ready():
	selected_top = 0
	selected_bottom = 0
	selected_shoes = 0

func _on_previous_top_button_pressed():
	if selected_top > 0:
		selected_top -= 1
	else:
		selected_top = 2

	match top_options[selected_top]:
		"none":
			player.black_top.visible = false
			player.pink_top.visible = false
		"pink_top":
			player.black_top.visible = false
			player.pink_top.visible = true
		"black_top":
			player.black_top.visible = true
			player.pink_top.visible = false
			
func _on_next_top_button_pressed():
	if selected_top < 2:
		selected_top += 1
	else:
		selected_top = 0
	
	match top_options[selected_top]:
		"none":
			player.black_top.visible = false
			player.pink_top.visible = false
		"pink_top":
			player.black_top.visible = false
			player.pink_top.visible = true
		"black_top":
			player.black_top.visible = true
			player.pink_top.visible = false


func _on_previous_bottom_button_pressed():
	if selected_bottom > 0:
		selected_bottom -= 1
	else:
		selected_bottom = 2
		
	match bottom_options[selected_bottom]:
		"none":
			player.light_blue_bottom.visible = false
			player.dark_blue_bottom.visible = false
		"light_blue_bottom":
			player.light_blue_bottom.visible = true
			player.dark_blue_bottom.visible = false
		"dark_blue_bottom":
			player.light_blue_bottom.visible = false
			player.dark_blue_bottom.visible = true

func _on_next_bottom_button_pressed():
	if selected_bottom < 2:
		selected_bottom += 1
	else:
		selected_bottom = 0

	match bottom_options[selected_bottom]:
		"none":
			player.light_blue_bottom.visible = false
			player.dark_blue_bottom.visible = false
		"light_blue_bottom":
			player.light_blue_bottom.visible = true
			player.dark_blue_bottom.visible = false
		"dark_blue_bottom":
			player.light_blue_bottom.visible = false
			player.dark_blue_bottom.visible = true


func _on_previous_shoes_button_pressed():
	if selected_shoes > 0:
		selected_shoes -= 1
	else:
		selected_shoes = 2
		
	match shoes_options[selected_shoes]:
		"none":
			player.red_shoes.visible = false
			player.black_shoes.visible = false
		"red_shoes":
			player.red_shoes.visible = true
			player.black_shoes.visible = false
		"black_shoes":
			player.red_shoes.visible = false
			player.black_shoes.visible = true

func _on_next_shoes_button_pressed():
	if selected_shoes < 2:
		selected_shoes += 1
	else:
		selected_shoes = 0
		
	match shoes_options[selected_shoes]:
		"none":
			player.red_shoes.visible = false
			player.black_shoes.visible = false
		"red_shoes":
			player.red_shoes.visible = true
			player.black_shoes.visible = false
		"black_shoes":
			player.red_shoes.visible = false
			player.black_shoes.visible = true
