extends Area2D

export (int) var speed = 20
export (int) var armor = 3
onready var main = get_tree().current_scene;
const EXPLOSION = preload("Explosion.tscn");

func _process(delta):
	var current_speed = speed * main.level
	position.x -= current_speed * delta
	if(position.x < 10):
		main.gameOver = true
		

func _on_Enemy_body_entered(body):
	body.queue_free()
	armor -= 1
	if(armor == 0):
		self.queue_free()
		if main.is_in_group("World"):
			main.score += 10



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _exit_tree():
	var explosion = EXPLOSION.instance()
	main.add_child(explosion)
	explosion.global_position = global_position;

