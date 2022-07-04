extends Area2D

const BULLET = preload("Bullet.tscn")
const EXPLOSION = preload("Explosion.tscn");
onready var main = get_tree().current_scene;
export (int) var SPEED = 100;


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
	
	if Input.is_action_just_pressed("ui_space"):
		fire_bullet()

	position.x = clamp(position.x,10 ,40)
	position.y = clamp(position.y,10 , ProjectSettings.get_setting("display/window/size/height")-10)
	
func fire_bullet():
	var bullet = BULLET.instance()
	get_parent().add_child(bullet)
	bullet.global_position = global_position


func _on_Ship_area_entered(area):
	area.queue_free()
	main.gameOver = true
	queue_free()

func _exit_tree():
	var explosion = EXPLOSION.instance()
	main.add_child(explosion)
	explosion.global_position = global_position;
