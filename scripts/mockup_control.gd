extends Control

@onready var cart = get_node("/root/FastFashion/Cart")
@onready var l_slider = $L_Slider
@onready var r_slider = $R_Slider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_r_slider_drag_ended(value_changed: bool) -> void:
	#cart.set_hand("right", r_slider.value)
	pass # Replace with function body.


func _on_l_slider_drag_ended(value_changed: bool) -> void:
	#cart.set_hand("left", l_slider.value)
	pass # Replace with function body.



func _on_l_slider_value_changed(value: float) -> void:
	#cart.set_hand("left", l_slider.value)
	pass # Replace with function body.


func _on_r_slider_value_changed(value: float) -> void:
	#cart.set_hand("right", r_slider.value)
	pass # Replace with function body.
