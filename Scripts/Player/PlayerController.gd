extends KinematicBody2D

var speed = 300
var MAXSPEED = 750 
var velocity
signal GameStarted

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		emit_signal("GameStarted")
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		emit_signal("GameStarted")
		velocity.y += speed
	move_and_slide(velocity)



func _on_Level_GameEnded():
	position.x = 38
	position.y = 308
