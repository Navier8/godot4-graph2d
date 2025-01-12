@tool
extends Control

var points_px := PackedVector2Array([])
var color: Color = Color.WHITE
var width: float = 1.0

var draw_line:bool = true
var draw_points:bool = true
var point_size:float = 4.0
var point_color:Color = Color.WEB_GREEN
var point_filled:bool = false
var point_frequency:int = 5

func _draw() -> void:
	if points_px.size() > 1:
		if draw_line:
			draw_polyline(points_px, color, width, true)
		
		if draw_points:
			for i:int in range(0 , points_px.size() , point_frequency):
				draw_circle(points_px[i] , point_size , point_color , point_filled , width , true)
