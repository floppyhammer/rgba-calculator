extends Control

var color: Color = Color.BLACK


func _ready():
	_update()


func _update():
	%ColorRect.color = color
	
	%Hex.text = color.to_html(true)
	
	%IntRgba.get_child(1).value = color.r * 255
	%IntRgba.get_child(2).value = color.g * 255
	%IntRgba.get_child(3).value = color.b * 255
	%IntRgba.get_child(4).value = color.a * 255
	
	%FloatRgba.get_child(1).value = color.r
	%FloatRgba.get_child(2).value = color.g
	%FloatRgba.get_child(3).value = color.b
	%FloatRgba.get_child(4).value = color.a
	
	%Rgba.text = str(color_to_rgba_int(color))
	%Argb.text = str(color_to_argb_int(color))


func rgba_int_to_color(value: int) -> Color:
	var r = value & (0xFF << 24)
	var g = value & (0xFF << 16)
	var b = value & (0xFF << 8)
	var a = value & 0xFF
	
	return Color(r / 255.0, g / 255.0, b / 255.0, a / 255.0)


func color_to_rgba_int(color: Color) -> int:
		return (int(color.r * 255) << 24) | (int(color.g * 255) << 16) | (int(color.b * 255) << 8) | (int(color.a * 255))


func argb_int_to_color(value: int) -> Color:
	var r = value & (0xFF << 16)
	var g = value & (0xFF << 8)
	var b = value & 0xFF
	var a = value & (0xFF << 24)
	
	return Color(r / 255.0, g / 255.0, b / 255.0, a / 255.0)


func color_to_argb_int(color: Color) -> int:
		return (int(color.a * 255) << 24) | (int(color.r * 255) << 16) | (int(color.g * 255) << 8) | (int(color.b * 255))


func _on_r_value_changed(value):
	color.r = value / 255.0
	_update()


func _on_g_value_changed(value):
	color.g = value / 255.0
	_update()


func _on_b_value_changed(value):
	color.b = value / 255.0
	_update()


func _on_a_value_changed(value):
	color.a = value / 255.0
	_update()


func _on_hex_text_changed(new_text):
	color = Color.from_string(new_text, Color.BLACK)
	_update()


func _on_float_r_value_changed(value):
	color.r = value
	_update()


func _on_float_g_value_changed(value):
	color.g = value
	_update()


func _on_float_b_value_changed(value):
	color.b = value
	_update()


func _on_float_a_value_changed(value):
	color.a = value
	_update()


func _on_rgba_text_changed(new_text):
	color = rgba_int_to_color(int(new_text))
	_update()


func _on_argb_text_changed(new_text):
	color = argb_int_to_color(int(new_text))
	_update()
