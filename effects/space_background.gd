extends ParallaxBackground

@onready var space_layer: ParallaxLayer = %SpaceLayer
@onready var far_starts_layer: ParallaxLayer = %FarStartsLayer
@onready var close_starts_layer: ParallaxLayer = %CloseStartsLayer

func _process(delta: float) -> void:
	space_layer.motion_offset.y += 2 * delta
	far_starts_layer.motion_offset.y += 5 * delta
	close_starts_layer.motion_offset.y += 20 * delta
