extends RigidBody2D

var velocity: Vector2 = Vector2.ZERO
export var ball_speed: float = 250
signal collided(collision)
func _ready() -> void:
	
	set_bounce(1)
	set_friction(0)
	apply_impulse(Vector2(), Vector2(1, 1).normalized() * ball_speed)
	#dd_central_force(velocity)
func _on_Ball_body_entered(body: Node) -> void:
	var bodies = get_colliding_bodies()
	body = bodies[0]
	if body.is_in_group("Brick"):
		body.queue_free()
		
		
		
	


func _on_Ball_collided(collision) -> void:
	pass # Replace with function body.
