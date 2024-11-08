extends Node2D

@onready var left_muzzule: Marker2D = $leftMuzzule
@onready var right_muzzule: Marker2D = $rightMuzzule
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lazers)
	pass # Replace with function body.
	
func fire_lazers() -> void:
	spawner_component.spawn(left_muzzule.global_position)
	spawner_component.spawn(right_muzzule.global_position)
	scale_component.tween_scale()
