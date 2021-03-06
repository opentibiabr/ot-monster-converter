local mType = Game.createMonsterType("Ripper Spectre")
local monster = {}

monster.description = "a ripper spectre"
monster.experience = 3500
monster.outfit = {
	lookType = 1119,
	lookHead = 101,
	lookBody = 39,
	lookLegs = 61,
	lookFeet = 39,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3800
monster.maxHealth = 3800
monster.race = "blood"
monster.corpse = 34664
monster.speed = 380
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	staticAttackChance = 70,
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
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 5},
	{id = "Great Spirit Potion", chance = 30910, maxCount = 2},
	{id = "Two Handed Sword", chance = 16500},
	{id = "Terra Rod", chance = 4780},
	{id = "Silver Brooch", chance = 15190},
	{id = "Emerald Bangle", chance = 14740},
	{id = "Twin Hooks", chance = 1170},
	{id = "Springsprout Rod", chance = 1210},
	{id = 34721, chance = 1890},
	{id = "Coral Brooch", chance = 1330},
	{id = "Serpent Sword", chance = 1950},
	{id = "Hexagonal Ruby", chance = 800},
	{id = "Assassin Dagger", chance = 970},
	{id = "Spike Sword", chance = 530},
	{id = "Wyvern Fang", chance = 120}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -370, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -200, maxDamage = -390, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -320, maxDamage = -460, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -200, maxDamage = -340, type = COMBAT_PHYSICALDAMAGE, length = 3, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 69,
	armor = 69,
	{name ="combat", interval = 2000, chance = 10, minDamage = 150, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
