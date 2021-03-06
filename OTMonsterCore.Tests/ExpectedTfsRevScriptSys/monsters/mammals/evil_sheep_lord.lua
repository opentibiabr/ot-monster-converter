local mType = Game.createMonsterType("Evil Sheep Lord")
local monster = {}

monster.description = "an evil sheep lord"
monster.experience = 340
monster.outfit = {
	lookType = 13,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 400
monster.maxHealth = 400
monster.race = "blood"
monster.corpse = 5994
monster.speed = 178
monster.summonCost = 0
monster.maxSummons = 3

monster.changeTarget = {
	interval = 2000,
	chance = 20
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Evil Sheep", chance = 30, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You can COUNT on us!", yell = false},
	{text = "Maeh!", yell = false},
	{text = "I feel you're getting sleepy! Maeh!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 75000, maxCount = 60}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -118, effect = CONST_ME_DRAWBLOOD},
	{name ="outfit", interval = 3000, chance = 20}
}

monster.defenses = {
	defense = 35,
	armor = 30,
	{name ="combat", interval = 2000, chance = 20, minDamage = 50, maxDamage = 100, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="outfit", interval = 1500, chance = 50}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
