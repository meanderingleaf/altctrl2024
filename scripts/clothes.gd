extends RigidBody3D


@export var type = ClothingImages.CLOTHING_TYPE.SEXY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#select type randomly
	type = ClothingImages.CLOTHING_TYPE.values().pick_random()
	
	#use type to select image
	var spritePath = ClothingImages.get_random_tagged(type)
	
	#set image
	$Sprite3D.texture = load(spritePath)
	
	pass # Replace with function body.
	
func override_type(type_in, image_path):
	type = type_in
	$Sprite3D.texture = load(image_path)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
