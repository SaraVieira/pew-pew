extends Node
onready var HIGHSCORELABEL = $HighScore

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://StartMenu.tscn")

func _ready():
	var saveData = SaveAndLoad.loadDataFromFile()
	HIGHSCORELABEL.text = "Highscore: "+ str(saveData.highScore)
