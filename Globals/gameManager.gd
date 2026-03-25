extends Node


const LANDING = preload("res://Scenes/Landing/landing.tscn")
const BATTLE_MAP = preload("res://Scenes/Battle Map/battleMap.tscn")
const CHANGE = preload("res://Scenes/Change/change.tscn")

var nextScene: PackedScene
var cx: Change


func _ready() -> void:
	cx = CHANGE.instantiate()
	add_child(cx)

func change_to_next() -> void:
	if nextScene:
		get_tree().change_scene_to_packed(nextScene)

func startTransition(toScene: PackedScene) -> void:
	nextScene = toScene
	cx.playAnimation()

func loadLandingScene() -> void:
	startTransition(LANDING)

func loadBattleScene() -> void:
	startTransition(BATTLE_MAP)
