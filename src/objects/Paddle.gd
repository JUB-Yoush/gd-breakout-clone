extends KinematicBody2D

var direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var speed: float = 500

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	direction = get_dir()
	velocity = direction * speed
	move_and_slide(velocity)


func get_dir():
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	return direction
