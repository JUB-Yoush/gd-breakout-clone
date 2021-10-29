extends RigidBody2D


export var ball_speed: float = 250
#var velocity: Vector2 = (ball_speed,ball_speed)
onready var main = get_parent()
signal collided(collision)
signal missed
func _ready() -> void:
	connect("body_entered",self,'_on_Ball_body_entered')
	connect("missed",main,'_on_Ball_missed')
	set_bounce(1)
	set_friction(0)
	linear_velocity.x = ball_speed
	linear_velocity.y = ball_speed
	#apply_impulse(Vector2(), Vector2(1, 1).normalized() * ball_speed)
	
func _on_Ball_body_entered(body: Node) -> void:
	var bodies = get_colliding_bodies()
	body = bodies[0]
	if body.is_in_group("Brick"):
		body.queue_free()
		
		
func _physics_process(delta: float) -> void:
	pass
	


func _on_Ball_collided(collision) -> void:
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited() -> void:
	emit_signal("missed")
