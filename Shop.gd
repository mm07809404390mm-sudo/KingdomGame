extends Control

func _ready():
	$VBoxContainer/BtnStarterPack.pressed.connect(_on_buy_starter_pack)
	$VBoxContainer/BtnDailyGold.pressed.connect(_on_buy_daily_gold)
	$VBoxContainer/BtnClose.pressed.connect(_on_close_shop)

func _on_buy_starter_pack():
	# طلب عملية شراء حزمة البداية وتأكيدها عبر السيرفر
	if has_node("/root/ServerManager"):
		get_node("/root/ServerManager").verify_purchase("starter_pack_01", "RECEIPT_MOCK_123")
	else:
		print("تم الشراء محلياً: حزمة البداية الخارقة!")

func _on_buy_daily_gold():
	if has_node("/root/ServerManager"):
		get_node("/root/ServerManager").verify_purchase("gold_box_small", "RECEIPT_MOCK_456")

func _on_close_shop():
	queue_free()