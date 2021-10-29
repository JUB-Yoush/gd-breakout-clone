extends KinematicBody2D

var direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var speed: float = 500
var lives: int = 3
var in_game = true
signal start_game
func _ready() -> void:
	emit_signal("start_game")
	pass


func _physics_process(delta: float) -> void:
	if in_game == true:
		direction = get_dir()
		velocity = direction * speed
		move_and_slide(velocity)


func get_dir():
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	return direction


func _on_Ball_missed() -> void:
	lives -= 1
