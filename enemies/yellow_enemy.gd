extends Enemy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	move_component.velocity.x = 20
	pass
