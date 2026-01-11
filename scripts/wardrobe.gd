extends Area2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var interact_label = $InteractLabel

var opened : bool = false

func _on_body_entered(body):
	if body is Player:
		body.can_change_outfit = true
		body.wardrobe_ref = self
		interact_label.visible = true
		

func _on_body_exited(body):
	if body is Player:
		body.can_change_outfit = false
		interact_label.visible = false
		if opened:
			animated_sprite_2d.play("closing")
			opened = false
			
			
