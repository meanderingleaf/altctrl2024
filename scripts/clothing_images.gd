extends Node

class_name clothing_images

enum CLOTHING_TYPE { CASUAL = 1, SEXY = 2, RETRO = 3 }

@export var collected_clothes : Array
@export var selected_sty = 0
@export var selected_style = "cas"

var clothes_list = {
	CLOTHING_TYPE.SEXY: [ "../sprites/glasses.png"  ],
	CLOTHING_TYPE.CASUAL: [ "../sprites/pants.png"  ],
	CLOTHING_TYPE.RETRO: [ "../sprites/dress.png" ]
}

func round_start_cleanup():
	collected_clothes = []
	pass
	

func collect_fashion(cloth):
	var clothing_data = {"type": cloth.type, "graphic": cloth.texture_path }
	collected_clothes.push_front(clothing_data) 
	
func seed_random_clothing(amt):
	for i in amt:
		collected_clothes.push_front( { "type": CLOTHING_TYPE.SEXY, "graphic": "../sprites/glasses.png"  } )
	pass

func select_round_style():
	
	#select style
	var rand_style = CLOTHING_TYPE.values().pick_random()
	selected_sty = rand_style
	selected_style = CLOTHING_TYPE.keys()[rand_style - 1]
	return selected_style

func get_random_tagged(tag):
	return clothes_list[tag].pick_random()
