extends Node2D

func _ready():
    $HitParticles.emitting = true


func _on_Timer_timeout():
	queue_free()
