extends Node2D

const ENEMY = preload("Enemy.tscn");
onready var spwanPoints = $SpawnPoints;
	
func get_spawn_point():
	var points = spwanPoints.get_children()
	points.shuffle()
	return points[0].global_position;

func spawn_enemy():
	var spawnPosition = get_spawn_point();
	var newEnemy = ENEMY.instance();
	var main = get_tree().current_scene
	main.add_child(newEnemy);
	newEnemy.global_position = spawnPosition;


func _on_Timer_timeout():
	spawn_enemy()
