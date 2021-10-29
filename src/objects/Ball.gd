extends RigidBody2D


onready var anim = $AnimationPlayer
onready var main = get_parent()


export var ball_speed: float = 250
var combo = 0
var firstHitPaddle = true


signal collided(collision)
signal missed
signal hit_brick(combo)
signal hit_paddle()

func _ready() -> void:
	#connect all the signals through code (we instance this scene in)
	connect("body_entered",self,'_on_Ball_body_entered')
	connect("missed",main,'_on_Ball_missed')
	connect("hit_brick",main,'_on_Ball_hit_brick')
	connect("hit_paddle",main,'_on_Ball_hit_paddle')
	
	#play the startup flash before moving
	anim.play("startup")
	yield(anim,"animation_finished")
	set_bounce(1)
	set_friction(0)
	linear_velocity.y = ball_speed
	
	
func _on_Ball_body_entered(body: Node) -> void:
	var bodies = get_colliding_bodies()
	body = bodies[0]
	
	if body.is_in_group("Brick"):
		combo += 1
		print(combo)
		emit_signal("hit_brick",combo)
		body.queue_free()
		
	elif body.is_in_group('Paddle'):
		#only apply horizontal velocity after ball touches paddle once (so it moves downard initally)
		if firstHitPaddle == true:
			#random direction (randi_range is brokey)
			var dirRandom = rand_range(-1,1)
			if dirRandom >0:
				ball_speed = ball_speed * -1
			elif dirRandom <0:
				ball_speed = ball_speed * 1
			linear_velocity.x = ball_speed
			firstHitPaddle = false
		combo = 0
		emit_signal("hit_paddle")
		
		
		
func _physics_process(delta: float) -> void:
	pass
	


func _on_Ball_collided(collision) -> void:
	print('hit another ball?')
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited() -> void:
	emit_signal("missed")
