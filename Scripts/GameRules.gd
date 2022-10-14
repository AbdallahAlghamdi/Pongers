extends Node

onready var ball = $Actors/Ball
var PlayerScore
var EnemyScore 
signal GameEnded
var hasGameEnded = true

onready var PlayAnim = $PlayScoreAnim
onready var EnemyAnim = $EnemyScoreAnim


func _ready():
	PlayAnim.animation = "Num0"

func updateEnemyScore():
	match (EnemyScore):
		0:
			EnemyAnim.animation = "Num0"
		1:
			EnemyAnim.animation = "Num1"
		2:
			EnemyAnim.animation = "Num2"
		3:
			EnemyAnim.animation = "Num3"
func updatePlayerScore():
	print("DING")
	match (PlayerScore):
		0:
			PlayAnim.animation = "Num0"
		1:
			PlayAnim.animation = "Num1"
		2:
			PlayAnim.animation = "Num2"
		3:
			PlayAnim.animation = "Num3"

func GameEnd():
	if(EnemyScore>PlayerScore):
		PlayAnim.animation = "Hewie"
		EnemyAnim.animation = "Howard"
	else:
		EnemyAnim.animation = "Hewie"
		PlayAnim.animation = "Howard"
	emit_signal("GameEnded")
	hasGameEnded = true
func _on_LoseTrigger_body_entered(body):
	EnemyScore += 1
	updateEnemyScore()
	_on_CountDownTimer_timeout()
	if EnemyScore>3:
		print("You lost!")
		GameEnd()
	else:
		resetBallPosition()

func resetBallPosition():
	
	ball.position.x = 512
	ball.position.y = 300

func _on_WinTrigger_body_entered(body):
	PlayerScore += 1
	updatePlayerScore()
	_on_CountDownTimer_timeout()
	
	if PlayerScore>3:
		print("You won!")
		GameEnd()
	else:
		resetBallPosition()

func _on_Player_GameStarted():
	if(hasGameEnded):
		print("new Game started")
		hasGameEnded = false
		PlayerScore = 0
		EnemyScore = 0
		updatePlayerScore()
		updateEnemyScore()


func _on_CountDownTimer_timeout():
	get_tree().call_group('BallGroup', 'stop_ball')
	 # Replace with function body.
