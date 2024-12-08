extends Node3D

var scores = {}
var targ_score = 4.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("omniaction"):
		get_tree().change_scene_to_file("res://scenes/mainGame.tscn")
	pass


func _on_judgement_timer_timeout() -> void:
	var total_pieces = $FashionTarget.pieces.size()
	tally_score($FashionTarget.pieces)
	
	if(total_pieces > 0):
		$ResultsScreen/pgCasual.value = ( scores.values()[0] / targ_score ) * 100 + 2
		$ResultsScreen/pgRetro.value = ( scores.values()[1] / targ_score ) * 100 + 2
		$ResultsScreen/pgSexy.value = ( scores.values()[2] / targ_score ) * 100 + 2
	
	$ResultsScreen.show_results()
	
	pass # Replace with function body.

func tally_score(pieces):
	
	for clothType in ClothingImages.CLOTHING_TYPE.values():
		scores[clothType] = 0
	
	for body in pieces:
		scores[body.type] += 1
		
	print(scores)
		
