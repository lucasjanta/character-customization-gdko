extends CharacterBody2D
class_name Player
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var change_outfit_animation = $"../ChangeOutfitAnimation"

@onready var pink_top = $pink_top
@onready var black_top = $black_top
@onready var light_blue_bottom = $light_blue_bottom
@onready var dark_blue_bottom = $dark_blue_bottom
@onready var red_shoes = $red_shoes
@onready var black_shoes = $black_shoes

@export var speed : float = 150.0
@export var gravity_force : float = 900.0

enum State { IDLE, PICK, WALK }
var state: State = State.IDLE
var can_change_outfit : bool = false
var wardrobe_ref : Area2D = null

func _physics_process(delta):
	_apply_gravity(delta)
	_process_state(delta)
	move_and_slide()
		
	
func _apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity_force * delta
	else:
		velocity.y = 0
		
func _unhandled_input(event):
	var horizontal_movement = Input.get_axis("left", "right")
	if horizontal_movement == 0:
		state = State.IDLE
		animated_sprite_2d.play("idle")
		pink_top.play("idle")
		black_top.play("idle")
		light_blue_bottom.play("idle")
		dark_blue_bottom.play("idle")
		red_shoes.play("idle")
		black_shoes.play("idle")
		
	else:
		state = State.WALK
		animated_sprite_2d.play("walk")
		pink_top.play("walk")
		black_top.play("walk")
		light_blue_bottom.play("walk")
		dark_blue_bottom.play("walk")
		red_shoes.play("walk")
		black_shoes.play("walk")
		
	if event.is_action_pressed("interact") and can_change_outfit:
		if wardrobe_ref.opened == false:
			wardrobe_ref.opened = true
			wardrobe_ref.interact_label.visible = false
			wardrobe_ref.animated_sprite_2d.play("opening")
			change_outfit_animation.play("start_customization")
	
func _process_state(delta):
	match state:
		State.IDLE:
			velocity.x = move_toward(velocity.x, 0, speed)
			
		State.WALK:
			var dir = Input.get_axis("left", "right")
			velocity.x = speed * dir
			if dir > 0:
				animated_sprite_2d.flip_h = false
				pink_top.flip_h = false
				black_top.flip_h = false
				light_blue_bottom.flip_h = false
				dark_blue_bottom.flip_h = false
				red_shoes.flip_h = false
				black_shoes.flip_h = false
			elif dir < 0:
				animated_sprite_2d.flip_h = true
				pink_top.flip_h = true
				black_top.flip_h = true
				light_blue_bottom.flip_h = true
				dark_blue_bottom.flip_h = true
				red_shoes.flip_h = true
				black_shoes.flip_h = true
				
