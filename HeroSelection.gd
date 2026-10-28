extends Control

# قائمة الأبطال المتاحين في اللعبة مع مهاراتهم الاستثمارية
var heroes_roster = [
	{"id": "hero_01", "name": "البطل العادي (صقر)", "buff": "سرعة حركة طبيعية", "price": 0, "unlocked": true},
	{"id": "hero_02", "name": "الساحر المدمر (لين)", "buff": "مضاعفة الذهب المكتسب بنسبة 50%", "price": 5000, "unlocked": false},
	{"id": "hero_03", "name": "قناص الظل (رايز)", "buff": "سرعة إطلاق نار خارقة", "price": 12000, "unlocked": false}
]

func _ready():
	print("🎮 تم تحميل قائمة الأبطال (Hero Roster) بنجاح!")
	display_available_heroes()

func display_available_heroes():
	for hero in heroes_roster:
		var status = "مفتوح وجاهز للعب" if hero["unlocked"] else "مغلق (يحتاج شراء بالعملات)"
		print("👤 البطل: ", hero["name"], " | المهارة: ", hero["buff"], " | الحالة: ", status)

# دالة اختيار أو شراء بطل جديد
func select_or_buy_hero(hero_id: String, player_gold: int):
	for hero in heroes_roster:
		if hero["id"] == hero_id:
			if hero["unlocked"]:
				print("✅ تم اختيار البطل بنجاح: ", hero["name"])
				return true
			else:
				if player_gold >= hero["price"]:
					hero["unlocked"] = true
					print("🎉 مبروك! تم شراء البطل الجديد: ", hero["name"])
					return true
				else:
					print("❌ عذراً، رصيد العملات غير كافٍ لشراء هذا البطل!")
					return false
	return false