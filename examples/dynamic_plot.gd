extends Control

@onready var graph: Graph2D = $Graph2D
@onready var plot: PlotItem = graph.add_plot_item(" ", Color.WHITE, 2)
var x: float = 0.0
var point: Vector2

func _process(_delta: float) -> void:
	var y: float = sin(x)
	point = Vector2(x,y)
	plot.add_point(point)
	x += 0.1
	if graph.x_max < point.x:
		graph.x_max = point.x
	if graph.y_max < point.y:
		graph.y_max = point.y
