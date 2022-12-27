extends KinematicBody2D


const KICK = Vector2(0, -1)


var speed = 300  # pixels/sec
var velocity = Vector2()


func _ready():
	pass


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("ui_head"):
		velocity += KICK
	if Input.is_action_just_released("ui_head"):
		velocity -= KICK
	velocity = velocity.normalized() * speed
	
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
