extends Area2D
@onready var animated_sprite_2d = $AnimatedSprite2D


func _on_body_entered(body):
	if body is Player:
		body.can_change_outfit = true
		body.wardrobe_ref = self


func _on_body_exited(body):
	if body is Player:
		body.can_change_outfit = false
		animated_sprite_2d.play_backwards("opening")
	
