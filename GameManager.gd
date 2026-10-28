extends Node

# نظام العملات والهدايا اليومية
var player_gold = 0
var last_login_day = 0
var login_streak = 0
var missions_completed = false

# جدول الهدايا اليومية (رخيصة ومغرية لحث اللاعب على الشراء واللعب)
const DAILY_REWARDS = [500, 1000, 2000, 3500, 5000, 7500, 15000] # هدايا تتصاعد كل يوم

func _ready():
	print("تم تفعيل نظام الهدايا اليومية والمهام الاستثمارية!")
	check_daily_login()

# دالة فحص وتوزيع الهدية اليومية
func check_daily_login():
	# محاكاة لفحص تسجيل الدخول اليومي
	print("مرحباً بك! هذه هدية تسجيل الدخول اليومية.")
	claim_daily_reward()

func claim_daily_reward():
	var reward = DAILY_REWARDS[min(login_streak, DAILY_REWARDS.size() - 1)]
	player_gold += reward
	login_streak += 1
	print("تم استلام هدية اليوم برصيد: ", reward, " قطعة ذهب! الرصيد الكلي: ", player_gold)

# نظام المهام اليومية (مهمة قتل عدداً من الوحوش للحصول على مكافأة)
func complete_daily_mission(mission_type: String):
	if not missions_completed:
		if mission_type == "kill_enemies":
			player_gold += 2500
			missions_completed = true
			print("مبروك! أنهيت مهام اليوم، حصلت على مكافأة 2500 عملة مارد!")