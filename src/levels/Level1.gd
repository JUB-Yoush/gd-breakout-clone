#----------------------------------
#TODO:
#made signals for the brick spawner having no more children, 
#used to tell if the player has won
#make win screen and a lose screen


#----------------------------------

extends Node2D
onready var paddle = $Paddle
var score = 0
onready var ballScene = preload("res://src/objects/Ball.tscn")
onready var scoreUI = $CanvasLayer/HBoxContainer/ScoreLabel
onready var livesUI = $CanvasLayer/HBoxContainer/LivesLabel
onready var WinLoseUI = $CanvasLayer/WinLoseLabel


func _ready() -> void:
	start_game()
	WinLoseUI.hide()




func _on_Ball_missed() -> void:
	paddle.lives -= 1
	livesUI.text = ('lives: '+ str(paddle.lives))
	start_game()

func start_game() -> void:
	if paddle.lives > 0:
		spawn_ball()
	else:
		WinLoseUI.text = ('You Lose!')
		WinLoseUI.show()

func spawn_ball() -> void:
	var ball = ballScene.instance()
	ball.position.x = 330
	ball.position.y = 280
	#ball.apply_impulse(Vector2(), Vector2(1, 1).normalized() * ball.ball_speed)
	call_deferred('add_child',ball)
	


func _on_BrickSpawner_all_blocks_broke() -> void:
	#game won
	WinLoseUI.text = ('You Win!')
	WinLoseUI.show()
	pass 

func _on_Ball_hit_brick(combo):
	print('ball hit brick')
	score += (5 + 5 * combo)
	scoreUI.text = ('Score: '+ str(score))
	


func _on_RestartButton_pressed() -> void:
	get_tree().reload_current_scene()
