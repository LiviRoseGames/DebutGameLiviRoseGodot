extends Area2D

onready var animated_sprite : AnimatedSprite = $AnimatedSprite

signal pressed
signal unpressed


func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body: PhysicsBody2D) -> void:
	if not body is Box:
		return
	animated_sprite.play("Down")
	emit_signal("pressed")
	
	
func _on_body_exited(body: PhysicsBody2D) -> void:
	if not body is Box:
		return
	animated_sprite.play("Up")
	emit_signal("pressed")
