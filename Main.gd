extends Node2D

@export var enemy_scene: PackedScene
@export var weapon_scene: PackedScene

func _ready():
	print("🚀 تشغيل لعبة King of Survival وتفعيل كافة الأنظمة الاستثمارية...")
	
	# 1. تفعيل السيرفر وقاعدة البيانات
	if has_node("/root/ServerManager"):
		get_node("/root/ServerManager").authenticate_player()
	
	# 2. فحص الهدايا والمهام اليومية
	if has_node("/root/GameManager"):
		get_node("/root/GameManager").check_daily_login()
	
	# 3. إطلاق مؤقت ظهور الوحوش التلقائي
	setup_spawner()
	
	# 4. تفعيل السلاح وإطلاق النار التلقائي للاعب
	setup_player_weapon()

func setup_spawner():
	var timer = Timer.new()
	timer.wait_time = 1.2 # ظهور عدو كل 1.2 ثانية
	timer.autostart = true
	timer.timeout.connect(_on_enemy_spawn_timeout)
	add_child(timer)

func setup_player_weapon():
	var player = get_node_or_null("Player")
	if player and weapon_scene:
		var weapon_instance = weapon_scene.instantiate()
		player.add_child(weapon_instance)
		print("⚔️ تم تجهيز البطل بالسلاح التلقائي!")

func _on_enemy_spawn_timeout():
	if not enemy_scene:
		return
	
	var enemy = enemy_scene.instantiate()
	enemy.add_to_group("enemies") # إضافة العدو لمجموعة الأهداف
	
	var player = get_node_or_null("Player")
	if player:
		# ظهور العدو في مكان عشوائي حول اللاعب
		var spawn_pos = player.global_position + Vector2(randf_range(-700, 700), randf_range(-500, 500))
		enemy.global_position = spawn_pos
		add_child(enemy)