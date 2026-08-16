@tool
extends GridContainer


@export var width := 5:
	set(value):
		width = value
		_remove_grid()
		_create_grid()
@export var height := 5:
	set(value):
		height = value
		_remove_grid()
		_create_grid()
@export var cellWidth := 100:
	set(value):
		cellWidth = value
		_remove_grid()
		_create_grid()
@export var cellHeight := 100:
	set(value):
		cellHeight = value
		_remove_grid()
		_create_grid()
@export var borderSize := 4:
	set(value):
		borderSize = value
		_remove_grid()
		_create_grid()
const CELL = preload("res://Obj/Grid-Cell.tscn")

func _ready() -> void:
	_create_grid()
	
func _create_grid():
	
	columns = width
	for i in (width * height):
		var gridCellNode = CELL.instantiate()
		gridCellNode.custom_minimum_size = Vector2(cellWidth, cellHeight)
		add_child(gridCellNode.duplicate())
		
func _remove_grid():
	for node in get_children():
		#when frame ends deletes this node
		node.queue_free()
