extends Area2D


func _ready():
	self.position.x = 460
	self.position.y = 400

func _process(_delta):	
	if Input.is_action_pressed("ui_head"):
		 $AnimationPlayer.play("jump")
