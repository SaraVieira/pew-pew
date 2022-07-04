extends Node

var score = 0 setget set_score;
var level = 1
var gameOver = false setget set_game_over;
onready var SCORE = $Score
onready var LEVEL = $Level

func set_score(val):
	score = val
	SCORE.text = "Score: " + str(score)
	level = int(score / 100) + 1
	LEVEL.text = "Level: " + str(level)

func set_game_over(val):
	if(val == true):
		# Wait for animation to be done
		yield(get_tree().create_timer(.6), "timeout")
		get_tree().paused = true
