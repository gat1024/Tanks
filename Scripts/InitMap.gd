extends Node2D


func _ready():
	set_camera_limits()
	pass

func set_camera_limits():
	var mapLimits = $Ground.get_used_rect()
	var mapCellSize = $Ground.cell_size
	$Player/Camera2D.limit_left   = mapLimits.position.x * mapCellSize.x
	$Player/Camera2D.limit_right  = mapLimits.end.x * mapCellSize.x
	$Player/Camera2D.limit_top    = mapLimits.position.y * mapCellSize.y
	$Player/Camera2D.limit_bottom = mapLimits.end.y * mapCellSize.y

func _on_Tank_shoot(bullet, _pos, _dir):
	var b = bullet.instance()
	add_child(b)
	b.start(_pos, _dir)