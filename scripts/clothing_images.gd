extends Node

class_name clothing_images

enum CLOTHING_TYPE { CASUAL = 1, SEXY = 2, RETRO = 3 }


var collected_clothes = []
var selected_sty = 0
var selected_style = "cas"

var clothes_list = {
	CLOTHING_TYPE.SEXY: [ "../sprites/glasses.png"  ],
	CLOTHING_TYPE.CASUAL: [ "../sprites/pants.png"  ],
	CLOTHING_TYPE.RETRO: [ "../sprites/dress.png" ]
}

func round_start_cleanup():
	collected_clothes = []

func select_round_style():
	
	#select style
	var rand_style = CLOTHING_TYPE.values().pick_random()
	selected_sty = rand_style
	selected_style = CLOTHING_TYPE.keys()[rand_style - 1]
	return selected_style

func get_random_tagged(tag):
	return clothes_list[tag].pick_random()
