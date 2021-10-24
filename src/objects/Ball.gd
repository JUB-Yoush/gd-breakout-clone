extends RigidBody2D

var velocity: Vector2 = Vector2.ZERO
export var ball_speed: float = 200
signal collided(collision)
func _ready() -> void:
	
	set_bounce(1)
	set_friction(0)
	apply_impulse(Vector2(), Vector2(1, 1).normalized() * ball_speed)
	#dd_central_force(velocity)
func _on_Ball_body_entered(body: Node) -> void:
	var bodies = get_colliding_bodies()
	if bodies[0] is TileMap:
		var tileMap = bodies[0]
		
		var colli_pos = self.position
		print('collison position: ',colli_pos)
		print('')
		var colli_pos_vector = Vector2(colli_pos.x,colli_pos.y)
		var colli_tile_coord = tileMap.world_to_map(colli_pos_vector)
		var ball_velocity = self.get_linear_velocity().normalized()
		print('ball velo: ',ball_velocity)
		print('')
		print('original tile coord',colli_tile_coord)
		
		if ball_velocity.x > 0:
			colli_tile_coord.x -= 1
			print('moving left: remove 1 from x')
			
		elif ball_velocity.x < 0:
			colli_tile_coord.x += 1
			print('moving right: add 1 from x')
		
		if ball_velocity.y < 0:
			colli_tile_coord.y -=1
			print('moving up: add remove one from y')
			
		elif ball_velocity.y > 0:
			colli_tile_coord.y +=1
			print('moving down: add 1 from y')
		
		print('modified tile coord: ',colli_tile_coord)
		
		
		
		var colli_tile = tileMap.get_cellv(colli_tile_coord)
		tileMap.set_cellv(colli_tile_coord,-1)
		#print(colli_tile)
		
		
	


func _on_Ball_collided(collision) -> void:
	pass # Replace with function body.
