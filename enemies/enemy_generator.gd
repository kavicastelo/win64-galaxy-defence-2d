extends Node2D

@export var GreenEnemyScene: PackedScene
@export var YellowEnemyScene: PackedScene
@export var PinkEnemyScene: PackedScene

@export var gameStats: GameStats

var margin = 8
var scene_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var green_enemy_spawn_timer: Timer = $GreenEnemySpawnTimer
@onready var yellow_enemy_spawn_timer: Timer = $YellowEnemySpawnTimer
@onready var pink_enemy_spawn_timer: Timer = $PinkEnemySpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	green_enemy_spawn_timer.timeout.connect(handle_spawn.bind(GreenEnemyScene, green_enemy_spawn_timer))
	yellow_enemy_spawn_timer.timeout.connect(handle_spawn.bind(YellowEnemyScene, yellow_enemy_spawn_timer, 5.0))
	pink_enemy_spawn_timer.timeout.connect(handle_spawn.bind(PinkEnemyScene, pink_enemy_spawn_timer, 10.0))

func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, scene_width - margin), -16))
	var spawn_rate = time_offset / (0.5 + (gameStats.score * 0.01))
	timer.start(spawn_rate + randf_range(0.25, 0.5))
