extends Area2D

export (int) var speed
export (int) var damage
export (float) var lifetime

var velocity = Vector2()


func _ready():

	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func start(_pos, _dir):
	position = _pos
	rotation = _dir .angle()
	$Lifetime.wait_time = lifetime
	velocity = _dir * speed
	
func _process(delta):
	position += velocity * delta
	

func explode():
	queue_free()

func _on_Bullet_body_entered(body):
	explode()
	if body.has_method('take_damage'):
		body.take_damage(damage)
		
	pass # replace with function body


func _on_Lifetime_timeout():
	explode()
	pass # replace with function body
