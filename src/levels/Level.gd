#----------------------------------
#TODO:
#made signals for the brick spawner having no more children, 
#used to tell if the player has won
#make win screen and a lose screen


#----------------------------------

extends Node2D
onready var paddle = $Paddle
onready var ballScene = preload("res://src/objects/Ball.tscn")
#spawn in the ball from here
func _ready() -> void:
	start_game()




func _on_Ball_missed() -> void:
	paddle.lives -= 1
	print(paddle.lives)
	start_game()

func start_game() -> void:
	if paddle.lives > 0:
		spawn_ball()
	else:
		print("game over")
		#send to a gameover screen, make message appear

func spawn_ball() -> void:
	var ball = ballScene.instance()
	ball.position.x = 330
	ball.position.y = 280
	#ball.apply_impulse(Vector2(), Vector2(1, 1).normalized() * ball.ball_speed)
	add_child(ball)
	


func _on_BrickSpawner_all_blocks_broke() -> void:
	#game won
	pass 
