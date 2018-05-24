extends Node

var tileSize = Vector2(128,128)

onready var texture = $Sprite.texture

func _ready():
	var textWidth = texture.get_width() / tileSize.x
	var textHeight = texture.get_height() / tileSize.y
	
	var ts = TileSet.new()
	var id = 0
	
	for x in range(textWidth):
		for  y in range(textHeight):
			var region = Rect2(x * tileSize.x, y * tileSize.y, tileSize.x, tileSize.y)
			ts.create_tile (id)
			ts.tile_set_texture(id, texture)
			ts.tile_set_region(id, region)
			id += 1
			print(id)
			
	ResourceSaver.save("res://Scenes/Maps/terrain_tiles.tres", ts)