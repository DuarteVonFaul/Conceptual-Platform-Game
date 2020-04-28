extends Area2D

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemy3_body_entered(body):
	
	if body.is_in_group("Player"):
		$AnimationPlayer.play("player_on")
		player = body
	pass # Replace with function body.

func _Explosao():
	if player != null:
		player.queue_free()
	
	pass

func _on_Enemy3_body_exited(body):
	player = null
	
	pass # Replace with function body.
