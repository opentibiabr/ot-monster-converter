local mType = Game.createMonsterType("Overcharged Energy Elemental")
local monster = {}

monster.description = "an overcharged energy elemental"
monster.experience = 1300
monster.outfit = {
	lookType = 290,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200
monster.maxHealth = 1200
monster.race = "undead"
monster.corpse = 8966
monster.speed = 300
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 20000,
	chance = 15
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
	canPushCreatures = false,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 1,
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
	{text = "BZZZZZZZZZZ", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 50000, maxCount = 100},
	{id = "gold coin", chance = 50000, maxCount = 56},
	{id = "small amethyst", chance = 10000, maxCount = 2},
	{id = "berserk potion", chance = 2173},
	{id = "great health potion", chance = 10000},
	{id = "energy soil", chance = 14285}
	-- wrong loot ?
	{id = 2214, chance = 560},									-- Ring of Healing
	{id = 8920, chance = 280},									-- Wand of Starstorm
}

monster.loot = {
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, effect = CONST_ME_DRAWBLOOD, interval = 2*1000},
	{name = "combat", type = COMBAT_ENERGYDAMAGE,  interval = 2*1000, chance = 17, range = 4, target = true, minDamage = -150, maxDamage = -420, radius = 2, shootEffect = CONST_ANI_ENERGYBALL , effect = CONST_ME_ENERGYHIT},
	{name = "combat", type = COMBAT_ENERGYDAMAGE,  interval = 2*1000, chance = 15, range = 4, target = true, minDamage = -100, maxDamage = -250, radius = 1, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY},
	{name = "charged energy elemental electrify", type = CONDITION_ENERGY,  interval = 2*1000, chance = 13},
}

monster.defenses = {
	defense = 35,
	armor = 35,
}

monster.elements = {
	{type = COMBAT_EARTHDAMAGE, percent = -20},
}

monster.immunities = {
	{type = "fire", combat = true, condition = true},
	{type = "energy", combat = true, condition = true},
	{type = "ice", combat = true, condition = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "BZZZZZZZZZZ", yell = false},
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)