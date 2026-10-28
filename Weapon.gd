extends Node2D

@export var bullet_scene: PackedScene
@export var fire_rate: float = 0.5 # سرعة إطلاق النار (كل نص ثانية)
var fire_timer: float = 0.0

func _process(delta):
	fire_timer += delta
	if fire_timer >= fire_rate:
		fire_timer = 0.0
		shoot_nearest_enemy()

func shoot_nearest_enemy():
	# البحث عن جميع الأعداء بالخريطة وإيجاد أقرب واحد
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.size() == 0:
		return
	
	var closest_enemy = enemies[0]
	var min_distance = global_position.distance_to(closest_enemy.global_position)
	
	for enemy in enemies:
		var dist = global_position.distance_to(enemy.global_position)
		if dist < min_distance:
			min_distance = dist
			closest_enemy = enemy
	
	# إطلاق النار باتجاه أقرب عدو
	print("🎯 تم إطلاق طلقة على العدو في مسافة: ", min_distance)