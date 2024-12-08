extends Node3D

var clothing_prefab = load("res://gameobjects/clothes.tscn")
var clothing_list = [ "sexy", "sexy", "hungry" ]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var inCannon = ClothingImages.collected_clothes.size()
	inCannon = 15
	for cloth in inCannon:	
		var n_clothes = clothing_prefab.instantiate()
		n_clothes.position = self.position
		var base_force =  -self.basis.z * 1000.0
		base_force.y += randf_range(-200, 1200)
		base_force.x += randf_range(-900, 900)
		n_clothes.apply_force(base_force)
		n_clothes.apply_torque(  Vector3( randf(), randf(), randf() ) * randf() * 20.0 )
		n_clothes.gravity_scale = 0.5
		add_child(n_clothes)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.
