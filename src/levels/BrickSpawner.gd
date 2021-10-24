extends Node2D

onready var brickScene: PackedScene = preload("res://src/objects/Brick.tscn")
export var spawn_width = 10
export var spawn_height = 5
var tile_sizeX = 48
var tile_sizeY = 16

func _ready() -> void:
	make_bricks()
	pass # Replace with function body.


func make_bricks()-> void:
	for x in spawn_width:
		for y in spawn_height:
			var brick = brickScene.instance()
			brick.position.x = x * tile_sizeX 
			brick.position.y = y * tile_sizeY 
			add_child(brick)
			
			 
