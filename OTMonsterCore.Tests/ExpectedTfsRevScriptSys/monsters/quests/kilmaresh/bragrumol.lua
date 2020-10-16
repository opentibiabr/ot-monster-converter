local mType = Game.createMonsterType("Bragrumol")
local monster = {}

monster.description = "Bragrumol"
monster.experience = 18000
monster.outfit = {
	lookType = 856,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 38000
monster.maxHealth = 38000
monster.race = "fire"
monster.corpse = 13973
monster.speed = 220
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 0,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{id = "Platinum Coin", chance = 100000, maxCount = 8},
	{id = "Flaming Arrow", chance = 60000, maxCount = 15},
	{id = "Red Gem", chance = 45000, maxCount = 15},
	{id = "Sea Horse Figurine", chance = 6700},
	{id = 36159, chance = 5760},
	{id = 31621, chance = 110},
	{id = "Winged Boots", chance = 110},
	{id = 35238, chance = 250},
	{id = "Magma Coat", chance = 48000},
	{id = "Stone Skin Amulet", chance = 54000}
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD, interval = 2*1000},
	{name = "combat", type = COMBAT_DEATHDAMAGE,  interval = 2*1000, chance = 17, range = 4, target = true, minDamage = -300, maxDamage = -600, radius = 1, shootEffect = CONST_ANI_SUDDENDEATH , effect = CONST_ME_MORTAREA},
	{name = "combat", type = COMBAT_DEATHDAMAGE,  interval = 2*1000, chance = 15, minDamage = -300, maxDamage = -600, radius = 4, effect = CONST_ME_MORTAREA},
	{name = "combat", type = COMBAT_FIREDAMAGE,  interval = 2*1000, chance = 20, range = 4, target = true, minDamage = -300, maxDamage = -600, radius = 3, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
}

monster.defenses = {
	defense = 84,
	armor = 84,
}

monster.elements = {
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_DEATHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 70},
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)