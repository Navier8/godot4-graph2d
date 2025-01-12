extends Control

@onready var graph: Graph2D = $Graph2D
@export var points: Array = [Vector2(0, 0), Vector2(2, 3.35), Vector2(3, 6), Vector2(4, 4)]

var seriesn:int = 200
var seriesx:PackedFloat64Array
var seriesy:PackedFloat64Array

func _ready() -> void:
	UpdateChart()

func UpdateChart() -> void:
	var plot1: PlotItem = graph.add_plot_item("Series 1", Color.WHITE, 2)
	for point in points:
		plot1.add_point(point)

	seriesx.resize(seriesn)
	seriesy.resize(seriesn)
	for i:int in range(seriesn):
		var x:float = 10.0 * float(i)/(seriesn-1)
		var y:float = 10.0*sin(x * PI)
		seriesx[i] = x
		seriesy[i] = y

	var plot2: PlotItem = graph.add_plot_item("Series 2", Color.RED, 2)
	plot2.add_series(seriesx , seriesy)
