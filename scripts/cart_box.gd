extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("collecting")
	body.freeze = true
	body.set_collision_layer_value(2, false)
	body.set_collision_mask_value(1, false)
	body.gravity_scale = 0
	body.get_parent().remove_child(body)
	self.add_child(body) 
	pass # Replace with function body.
