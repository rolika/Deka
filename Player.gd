extends Area2D


const KICK = Vector2(0, -1500)


onready var head = get_node("Headracket")


var speed = 300  # pixels/sec
var screen_size
var half_width


func _ready():
	screen_size = get_viewport_rect().size
	half_width = 39

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 0+half_width, screen_size.x-half_width)


func _physics_process(_delta):
	
	if Input.is_action_just_pressed("ui_head"):
		head.move_and_slide(KICK)
	if Input.is_action_just_released("ui_head"):
		head.move_and_slide(KICK.rotated(PI))
