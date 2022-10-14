extends KinematicBody2D

var speed = 0
var velocity = Vector2.ZERO
var collision_object
onready var audioplayer = $"../../AudioPlayer"



func _ready():
	randomize()

	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
	
func _physics_process(delta):
	
	collision_object = move_and_collide(velocity * speed  * delta)
	if collision_object:
		audioplayer.play()
		velocity = velocity.bounce(collision_object.normal)
		

func stop_ball():
	speed = 0
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
func _on_Player_GameStarted():
	speed = 590
	


func _on_Level_GameEnded():
	speed = 0
	position.x= 512
	position.y=300
