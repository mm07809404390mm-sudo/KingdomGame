
extends Node2D

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	# أرض المملكة
	draw_rect(Rect2(-640, -360, 1280, 720), Color("#789653"))

	# طرق المملكة
	draw_rect(Rect2(-640, 100, 1280, 90), Color("#c6b18a"))
	draw_rect(Rect2(-70, -360, 140, 720), Color("#c6b18a"))

	# ساحة القلعة
	draw_rect(Rect2(-190, -150, 380, 300), Color("#a5a99b"))

	# جدران القلعة
	draw_rect(Rect2(-160, -120, 320, 240), Color("#c8c5b9"))

	# أبراج القلعة
	draw_rect(Rect2(-185, -145, 65, 65), Color("#777d80"))
	draw_rect(Rect2(120, -145, 65, 65), Color("#777d80"))
	draw_rect(Rect2(-185, 80, 65, 65), Color("#777d80"))
	draw_rect(Rect2(120, 80, 65, 65), Color("#777d80"))

	# المبنى الرئيسي
	draw_rect(Rect2(-75, -95, 150, 190), Color("#e0d6bd"))
	draw_rect(Rect2(-45, -130, 90, 70), Color("#8b4936"))
	draw_rect(Rect2(-35, 25, 70, 70), Color("#70442f"))

	# بوابة القلعة
	draw_rect(Rect2(-28, 45, 56, 75), Color("#513b2e"))

	# أشجار حول المملكة
	for p in [
		Vector2(-350, -220), Vector2(350, -220),
		Vector2(-420, 20), Vector2(420, 220),
		Vector2(-350, 250), Vector2(340, 80)
	]:
		draw_circle(p, 25, Color("#426b38"))
		draw_circle(p + Vector2(-5, -7), 16, Color("#5c873e"))

	# اسم المملكة
	draw_string(
		ThemeDB.fallback_font,
		Vector2(-95, -185),
		"MY KINGDOM",
		HORIZONTAL_ALIGNMENT_LEFT,
		-1,
		26,
		Color.WHITE
	)
