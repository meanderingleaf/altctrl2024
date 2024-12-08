extends Control



func show_message(style):
	var message = "Jessica: Hey boo, party tonight!! Put together a %s fit! \n Bear: .... rrragh"
	$ColorRect/RichTextLabel.text = message % style

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
