local mType = Game.createMonsterType("Choking Fear")
local monster = {}

monster.description = "a choking fear"
monster.experience = 4700
monster.outfit = {
	lookType = 586,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5800
monster.maxHealth = 5800
monster.race = "undead"
monster.corpse = 22493
monster.speed = 380
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Ah, sweet air... don't you miss it?", yell = false},
	{text = "Murr tat muuza!", yell = false},
	{text = "kchh", yell = false},
	{text = "hsssss", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 100000, maxCount = 100},
	{id = "platinum coin", chance = 100000, maxCount = 8},
	{id = "energy ring", chance = 3000},
	{id = "life ring", chance = 4200},
	{id = "ring of healing", chance = 3000},
	{id = "guardian shield", chance = 1540},
	{id = "beastslayer axe", chance = 3290},
	{id = "brown piece of cloth", chance = 6000},
	{id = "yellow piece of cloth", chance = 3500},
	{id = "great mana potion", chance = 20000, maxCount = 3},
	{id = "terra boots", chance = 720},
	{id = "great spirit potion", chance = 20000, maxCount = 3},
	{id = "ultimate health potion", chance = 19000, maxCount = 3},
	{id = "spellbook of mind control", chance = 720},
	{id = "underworld rod", chance = 720},
	{id = "springsprout rod", chance = 510},
	{id = "green crystal shard", chance = 1540},
	{id = "brown crystal splinter", chance = 52500, maxCount = 2},
	{id = "blue crystal splinter", chance = 10000, maxCount = 3},
	{id = "cluster of solace", chance = 620},
	{id = "dead weight", chance = 14180},
	{id = "hemp rope", chance = 14180}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -499, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 600, interval = 4000}},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 10, minDamage = -700, maxDamage = -900, length = 5, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -300, type = COMBAT_PHYSICALDAMAGE, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true},
	{name ="speed", interval = 2000, chance = 20, speedChange = -800, duration = 15000},
	{name ="combat", interval = 2000, chance = 10, minDamage = -130, maxDamage = -300, type = COMBAT_MANADRAIN, effect = CONST_ME_SOUND_RED, target = false},
	{name ="combat", interval = 2000, chance = 20, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -250, maxDamage = -500, type = COMBAT_DEATHDAMAGE, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 10, minDamage = 80, maxDamage = 150, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
