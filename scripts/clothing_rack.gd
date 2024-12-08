extends Path3D

var clothing_prefab = load("res://gameobjects/clothes.tscn")
@export var clothing_count = 5.0

func spawn_clothes():

	for i in clothing_count:
		var clothing_loc = curve.samplef(i/clothing_count*curve.point_count)
		
		var n_clothes = clothing_prefab.instantiate()
		n_clothes.position = clothing_loc
		#get_node("/root/FastFashion").
		add_child(n_clothes)
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
