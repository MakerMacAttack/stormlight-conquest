extends CanvasLayer


class_name Change


@onready var animation_player: AnimationPlayer = $animationPlayer


# Called when the node enters the scene tree for the first time.
func switchScene() -> void:
	GameManager.change_to_next()

func playAnimation() -> void:
	animation_player.play("fade")
