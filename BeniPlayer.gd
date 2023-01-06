extends Area2D


var speed = 400
var screen_size


func _ready():
	self.position.x = 460
	self.position.y = 400
	screen_size = get_viewport_rect().size

func _process(delta):	
	var velocity = Vector2.ZERO  # player's movement vector
	if Input.is_action_pressed("ui_head"):
		 $AnimationPlayer.play("jump")
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
