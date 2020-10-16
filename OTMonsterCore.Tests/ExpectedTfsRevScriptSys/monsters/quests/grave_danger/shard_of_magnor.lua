local mType = Game.createMonsterType("Shard Of Magnor")
local monster = {}

monster.description = "a shard of magnor"
monster.experience = 0
monster.outfit = {
	lookType = 1221,
	lookHead = 19,
	lookBody = 76,
	lookLegs = 114,
	lookFeet = 76,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 20000
monster.maxHealth = 20000
monster.race = "venom"
monster.corpse = 0
monster.speed = 250
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
}

monster.attacks = {
	{name = "melee", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, minDamage = 0, maxDamage = -1000, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", type = COMBAT_PHYSICALDAMAGE, interval = 2*1000, chance = 15, length = 8, spread = 0, minDamage = -400, maxDamage = -1000, effect = CONST_ME_STONES},
	{name = "combat", type = COMBAT_MANADRAIN, interval = 2*1000, chance = 10, length = 8, spread = 3, minDamage = -400, maxDamage = -1000, effect = CONST_ME_GREEN_RINGS},
}

monster.defenses = {
	defense = 78,
	armor = 78,
	{name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2*1000, minDamage = 150, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE},
}

monster.immunities = {
	{type = "earth", combat = true, condition = true},
	{type = "death", combat = true, condition = true},
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
}


mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)