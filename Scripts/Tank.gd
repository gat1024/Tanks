extends KinematicBody2D

signal shoot
signal healthChanged
signal dead


export (PackedScene) var Bullet
export (int) var speed
export (float) var rotationSpeed
export (float) var gunCoolDown
export (int) var health

var velocity = Vector2()
var canShoot = true
var alive    = true

func _ready():
	$GunTimer.wait_time = gunCoolDown
	
func control(delta):
	pass
	
func _physics_process(delta):
	if not alive:
		return
		
	control(delta)
	move_and_slide (velocity)

func shoot():
	if canShoot:
		canShoot = false
		$GunTimer.start()
		var dir = Vector2(1,0).rotated($Turret.global_rotation)
		emit_signal('shoot', Bullet, $Turret/Muzzle.global_position, dir)
	pass

func _on_GunTimer_timeout():
	canShoot = true
	pass # replace with function body
