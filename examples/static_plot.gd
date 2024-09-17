extends Control

@onready var graph: Graph2D = $Graph2D
@export var points: Array = [Vector2(0, 0), Vector2(2, 3), Vector2(3, 6), Vector2(4, 4)]

func _ready() -> void:
	UpdateChart()

func UpdateChart() -> void:
	var plot: PlotItem = graph.add_plot_item(" ", Color.WHITE, 2)
	for point in points:
		plot.add_point(point)
