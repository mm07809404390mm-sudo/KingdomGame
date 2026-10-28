extends Sprite2D

func _process(delta):
    position.x += 100.0 * delta
    rotation += 2.0 * delta
