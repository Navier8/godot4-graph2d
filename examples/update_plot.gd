extends Control

@onready var graph:Graph2D = $Graph2D

var seriesn:int = 400
var seriesx:PackedFloat64Array
var seriesy:PackedFloat64Array

var plot: PlotItem
var time:float = 0.0
var count:int = 0

func _ready() -> void:
	seriesx.resize(seriesn)
	seriesy.resize(seriesn)
	for i:int in range(seriesn):
		var x:float = float(i)/(seriesn-1)
		var y:float = sin(5.0 * x * PI)
		seriesx[i] = x
		seriesy[i] = y

	plot = graph.add_plot_item(" ", Color.RED, 2)
	plot.add_series(seriesx , seriesy)

	plot.draw_line = true
	plot.draw_points = true
	plot.point_size = 2
	plot.point_color = Color.WEB_GREEN
	plot.point_filled = false
	plot.point_frequency = 1


func _process(delta:float) -> void:
	count += 1
	
	if count % 2 == 0:
		for i:int in range(seriesn):
			time += delta
			var x:float = float(i)/(seriesn-1)
			var t:float = time/PI/100.0
			var y:float = sin(5.0 * x * PI + t) + sin(30.0 * x * PI + t)
			seriesy[i] = y
		plot.update(seriesx,seriesy)
