extends Node2D

@onready var left_muzzule: Marker2D = $leftMuzzule
@onready var right_muzzule: Marker2D = $rightMuzzule
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var flame_animated_sprite: AnimatedSprite2D = $"Anchor/Flame AnimatedSprite"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lazers)
	pass # Replace with function body.
	
func fire_lazers() -> void:
	spawner_component.spawn(left_muzzule.global_position)
	spawner_component.spawn(right_muzzule.global_position)
	scale_component.tween_scale()

func _process(delta: float) -> void:
	animate_the_ship()
	
func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("bank_left")
		flame_animated_sprite.play("bank_left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("bank_right")
		flame_animated_sprite.play("bank_right")
	else:
		animated_sprite_2d.play("center")
		flame_animated_sprite.play("center")
