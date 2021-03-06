#----------------------------------
#TODO:
#----------------------------------

extends Node2D
onready var paddle = $Paddle
onready var ballScene = preload("res://src/objects/Ball.tscn")
onready var scoreUI = $CanvasLayer/HBoxContainer/ScoreLabel
onready var livesUI = $CanvasLayer/HBoxContainer/LivesLabel
onready var comboUI = $CanvasLayer/HBoxContainer/ComboLabel
onready var WinLoseUI = $CanvasLayer/WinLoseLabel

var score = 0

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
		paddle.in_game = false
		WinLoseUI.show()

func spawn_ball() -> void:
	var ball = ballScene.instance()
	ball.position.x = 330
	ball.position.y = 280
	call_deferred('add_child',ball)
	


func _on_BrickSpawner_all_blocks_broke() -> void:
	#game won
	WinLoseUI.text = ('You Win!')
	WinLoseUI.show()
	pass 

func _on_Ball_hit_brick(combo):
	score += (5 + 5 * combo)
	scoreUI.text = ('Score: '+ str(score))
	if combo >= 2:
		comboUI.text = ('x'+str(combo))
	if combo == 5:
		spawn_ball()
	
func _on_Ball_hit_paddle():
	comboUI.text = ('')

func _on_RestartButton_pressed() -> void:
	get_tree().reload_current_scene()
