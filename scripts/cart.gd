extends CharacterBody3D

@export var speed = 1.9
@export var turn_rate = .008
@export var turn_force = 0

var left_hold = turn_rate
var right_hold = turn_rate

var r_tween : Tween
var l_tween : Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.velocity = self.basis.x * speed
	move_and_slide()
	self.rotate_y(turn_force)
	#self.angular_velocity = Vector3(0, turn_force, 0)
	
	#input stuff
	if Input.is_action_just_pressed("left_high"):
		set_hand("left", 90)
		
	if Input.is_action_just_pressed("left_low"):
		set_hand("left", 10)
		
	if Input.is_action_just_pressed("right_high"):
		set_hand("right", 90)
		
	if Input.is_action_just_pressed("right_low"):
		set_hand("right", 10)
	
	pass

func set_hand(hand, value):
	var turn_val = 0
	
	if value < 20:
		turn_val = turn_rate
		
	if hand == "right":
		#$"HandHolder/R Hand".position.y = (float(value)/100) * 1.2
		var r_tmp = $"HandHolder/R Hand".position
		r_tmp.y = (float(value)/100) * 1.2
		right_hold = -turn_val
		r_tween = self.create_tween()
		r_tween.tween_property($"HandHolder/R Hand", "position", r_tmp, .2)


	else:
		#$"HandHolder/L Hand".position.y = (float(value)/100) * 1.2
		var l_tmp = $"HandHolder/L Hand".position
		l_tmp.y = (float(value)/100) * 1.2
		left_hold = turn_val
		l_tween = self.create_tween()
		l_tween.tween_property($"HandHolder/L Hand", "position", l_tmp, .2)
	
	turn_force = left_hold + right_hold
	
	if(turn_force > 0):
		$ModelHolder.rotation = Vector3(-.5,0,0)
	elif turn_force < 0:
		$ModelHolder.rotation =  Vector3(.5,0,0)
	else:
		$ModelHolder.rotation = Vector3(0,0,0)

func paw_hit(body):
	if(body.is_in_group("clothes")):
		#visibly collect
		var throwDir = $ThrowPosition.global_position - body.global_position
		body.gravity_scale = 1
		body.apply_force(throwDir.normalized() * 2000)
		
		#audio!
		$SFX/BearSFX.play(0)
		
		#fashion meter
		get_node("/root/FastFashion").clothing_collected()
		

func _on_right_paw_area_body_entered(body: Node3D) -> void:
	paw_hit(body)


func _on_left_paw_area_body_entered(body: Node3D) -> void:
	paw_hit(body)
