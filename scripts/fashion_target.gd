extends Area3D

var pieces = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	body.linear_velocity = Vector3.ZERO
	body.gravity_scale = 0
	pieces.push_front(body)
	$SplatSFX.play()
	#angular_velocity = Vector3.ZERO
	pass # Replace with function body.
