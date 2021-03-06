local mType = Game.createMonsterType("Kraknaknork")
local monster = {}

monster.description = "Kraknaknork"
monster.experience = 300
monster.outfit = {
	lookType = 6,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 80
monster.maxHealth = 80
monster.race = "blood"
monster.corpse = 5978
monster.speed = 180
monster.summonCost = 0
monster.maxSummons = 1

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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 23,
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
	{name = "Weakened Demon", chance = 20, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "KRAK ORC DEMON", yell = false},
	{text = "???!!!", yell = false},
	{text = "Grak brrretz gulu.", yell = false}
}

monster.loot = {
	{id = 2148, chance = 95000, maxCount = 15},
	{id = 12435, chance = 1000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -10, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 5, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -1, maxDamage = -15, type = COMBAT_ICEDAMAGE, length = 7, spread = 3, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -1, maxDamage = -10, type = COMBAT_EARTHDAMAGE, length = 6, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -1, maxDamage = -12, type = COMBAT_PHYSICALDAMAGE, length = 7, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -8, type = COMBAT_PHYSICALDAMAGE, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 6, speedChange = -100, duration = 20000},
	{name ="outfit", interval = 2000, chance = 10}
}

monster.defenses = {
	defense = 5,
	armor = 5
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
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
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
