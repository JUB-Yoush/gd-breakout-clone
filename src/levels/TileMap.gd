extends TileMap
export var width = 10
export var height = 5

func _ready() -> void:
	for x in width:
		for y in height:
			set_cell(x,y,3)
			




