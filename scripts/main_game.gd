extends Node3D

@onready var fashionProgress = $GameUI/prgFashion
var collected = 0
@export var max_collected = 15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ClothingImages.select_round_style()
	get_tree().call_group("clothing_rack", "spawn_clothes")
	$GameStartUI.show_message(ClothingImages.selected_style)
	pass # Replace with function body.
	
func clothing_collected():
	collected = collected + 1
	fashionProgress.value = float(collected) /  float(max_collected) * 100

	if(collected >= max_collected):
		$RoundCompleteAnim.visible = true
		#move to next scene
		$RoundCompleteAnim.play()
		$Cart.speed = 0
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
	pass
