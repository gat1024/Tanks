extends "res://Scripts/Tank.gd"


func control(delta):
	$Turret.look_at(get_global_mouse_position())
	
	var rotDir = 0
	
	if Input.is_action_pressed('turnRight'):
		rotDir += 1
	if Input.is_action_pressed('turnLeft'):
		rotDir -= 1
	
	rotation += rotationSpeed * rotDir * delta
	velocity = Vector2()
	
	if Input.is_action_pressed('forward'):
		velocity = Vector2(speed, 0).rotated(rotation)
		
	if Input.is_action_pressed('backward'):
		velocity = Vector2(-speed / 2, 0).rotated(rotation)
		
	if Input.is_action_just_pressed('click'):
		shoot()

