extends Sprite

func _process(delta):
	position.x += 100 * delta
	rotation += 2 * delta
