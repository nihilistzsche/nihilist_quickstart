-- Defining arrays
local inserters = {}
local pipes = {}
local mining_drills = {}
local power_production = {}
local loaders = {}
local assemblers = {}
local ammo = {}

-- Building vanilla arrays

table.insert(inserters, "None")
table.insert(inserters, "Burner only")
table.insert(inserters, "Electric only")

table.insert(pipes, "None")
table.insert(pipes, "Iron")

table.insert(mining_drills, "None")
table.insert(mining_drills, "Burner mining drills")
table.insert(mining_drills, "Electric mining drills")

table.insert(power_production, "None")
table.insert(power_production, "Steam Power")
table.insert(power_production, "Solar Power")

table.insert(loaders, "None")

table.insert(assemblers, "None")
table.insert(assemblers, "Electric")

table.insert(ammo, "Firearm magazine")
table.insert(ammo, "Piercing rounds")


 data:extend({
	{
		type = "bool-setting",
		name = "uqs-clear-inventory",
		setting_type = "runtime-global",
		default_value = true,
		order = "aaaa"
	},
	{
		type = "string-setting",
		name = "uqs-inserter-type",
		setting_type = "runtime-global",
		default_value = "Burner only",
		allowed_values = inserters,
		order = "aaab"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-inserters",
		setting_type = "runtime-global",
		default_value = 200,
		maximum_value = 1000,
		minimum_value = 0,
		order = "aab"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-belts",
		setting_type = "runtime-global",
		default_value = 1000,
		maximum_value = 2000,
		minimum_value = 0,
		order = "abb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-undergrounds",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 250,
		minimum_value = 0,
		order = "abc"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-splitters",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 250,
		minimum_value = 0,
		order = "abd"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-pipes",
		setting_type = "runtime-global",
		default_value = 100,
		maximum_value = 500,
		minimum_value = 0,
		order = "acb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-pipe-undergrounds",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 250,
		minimum_value = 0,
		order = "acc"
	},
	{
		type = "string-setting",
		name = "uqs-miner-type",
		setting_type = "runtime-global",
		default_value = "Burner mining drills",
		allowed_values = mining_drills,
		order = "ada"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-miners",
		setting_type = "runtime-global",
		default_value = 100,
		maximum_value = 500,
		minimum_value = 0,
		order = "adb"
	},
	{
		type = "string-setting",
		name = "uqs-labs-assemblers",
		setting_type = "runtime-global",
		default_value = "Electric",
		allowed_values = assemblers,
		order = "aea"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-labs",
		setting_type = "runtime-global",
		default_value = 4,
		maximum_value = 20,
		minimum_value = 0,
		order = "aeb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-assemblers",
		setting_type = "runtime-global",
		default_value = 10,
		maximum_value = 100,
		minimum_value = 0,
		order = "aed"
	},
	{
		type = "string-setting",
		name = "uqs-power-type",
		setting_type = "runtime-global",
		default_value = "Steam Power",
		allowed_values = power_production,
		order = "afa"
	},
	{
		type = "double-setting",
		name = "uqs-desired-power-output",
		setting_type = "runtime-global",
		default_value = 7.2,
		maximum_value = 36,
		minimum_value = 0,
		order = "afb"
	},
	{
		type = "bool-setting",
		name = "uqs-provide-accumulators",
		setting_type = "runtime-global",
		default_value = true,
		order = "afc"
	},
	{
		type = "bool-setting",
		name = "uqs-electric-inserters",
		setting_type = "runtime-global",
		default_value = false,
		order = "aff"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-poles",
		setting_type = "runtime-global",
		default_value = 200,
		maximum_value = 500,
		minimum_value = 0,
		order = "afh"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-furnaces",
		setting_type = "runtime-global",
		default_value = 50,	
		maximum_value = 200,
		minimum_value = 0,
		order = "agb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-chests",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 100,
		minimum_value = 0,
		order = "agd"
	},
	{
		type = "string-setting",
		name = "uqs-fuel-type",
		setting_type = "runtime-global",
		default_value = "Coal",
		allowed_values = {"Wood", "Coal", "Solid Fuel", "None"},
		order = "age"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-fuel",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 500,
		minimum_value = 0,
		order = "agf"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-cliff-explosives",
		setting_type = "runtime-global",
		default_value = 20,
		maximum_value = 200,
		minimum_value = 0,
		order = "agg"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-gun-turrets",
		setting_type = "runtime-global",
		default_value = 0,
		maximum_value = 100,
		minimum_value = 0,
		order = "aha"
	},
	{
		type = "string-setting",
		name = "uqs-type-of-gun-turret-ammo",
		setting_type = "runtime-global",
		default_value = "Firearm magazine",
		allowed_values = ammo,
		order = "ahb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-gun-turret-ammo",
		setting_type = "runtime-global",
		default_value = 20,
		maximum_value = 200,
		minimum_value = 0,
		order = "ahc"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-stone-walls",
		setting_type = "runtime-global",
		default_value = 200,
		maximum_value = 2000,
		minimum_value = 0,
		order = "ahd"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-gates",
		setting_type = "runtime-global",
		default_value = 20,
		maximum_value = 200,
		minimum_value = 0,
		order = "ahe"
	}
})

if mods["deadlock-integrations"] then

table.insert(loaders, "Deadlock's Loaders")

data:extend({
	{
		type = "string-setting",
		name = "uqs-loader-type",
		setting_type = "runtime-global",
		default_value = "None",
		allowed_values = loaders,
		order = "abea"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-loaders",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 250,
		minimum_value = 0,
		order = "abeb"
	}
})
end

if mods["vanilla-loaders-hd"] then

table.insert(loaders, "Vanilla Loaders HD")

data:extend({
	{
		type = "string-setting",
		name = "uqs-loader-type",
		setting_type = "runtime-global",
		default_value = "None",
		allowed_values = loaders,
		order = "abea"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-loaders",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 250,
		minimum_value = 0,
		order = "abeb"
	}
})
end

if mods["miniloader"] then

table.insert(loaders, "Miniloaders")

data:extend({
	{
		type = "string-setting",
		name = "uqs-loader-type",
		setting_type = "runtime-global",
		default_value = "None",
		allowed_values = loaders,
		order = "abea"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-loaders",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 250,
		minimum_value = 0,
		order = "abeb"
	}
})
end

if mods["Mining_Drones"] then

table.insert(mining_drills, "Mining Drones")

data:extend({
	{
		type = "int-setting",
		name = "uqs-number-of-mining-depots",
		setting_type = "runtime-global",
		default_value = 5,
		maximum_value = 10,
		minimum_value = 0,
		order = "adab"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-mining-drones",
		setting_type = "runtime-global",
		default_value = 100,
		maximum_value = 1000,
		minimum_value = 0,
		order = "adac"
	}
})
end

if mods["Electric Furnaces"] then
data:extend({
	{
		type = "bool-setting",
		name = "uqs-electric-furnaces",
		setting_type = "runtime-global",
		default_value = true,
		order = "aga"
	}
})
end

if mods["boblogistics"] then
data:extend({
	{
		type = "bool-setting",
		name = "uqs-bob-belts",
		setting_type = "runtime-global",
		default_value = true,
		order = "aba"
	}
})
end

if mods["boblogistics"] then
data:extend({
	{
		type = "bool-setting",
		name = "uqs-bob-pipes",
		setting_type = "runtime-global",
		default_value = true,
		order = "aca"
	}
})
end

if mods["aai-industry"] then

table.insert(power_production, "AAII Burner Turbines")
table.insert(assemblers, "AAII Burner")

data:extend({
	{
		type = "bool-setting",
		name = "uqs-aai-power-poles",
		setting_type = "runtime-global",
		default_value = true,
		order = "afg"
	}
})
end

if mods["apm_power"] then

table.insert(assemblers, "Amator Phasma's Burner")

end

if mods["CW-thermal-solar-power"] then

table.insert(power_production, "Thermal Solar Power")

data:extend({
	{
		type = "bool-setting",
		name = "uqs-provide-steam-battery",
		setting_type = "runtime-global",
		default_value = true,
		order = "afd"
	},
	{
		type = "bool-setting",
		name = "uqs-provide-heat-accumulators",
		setting_type = "runtime-global",
		default_value = false,
		order = "afe"
	}
})
end

if mods["angelsrefining"] then
data:extend({
	{
		type = "bool-setting",
		name = "uqs-type-of-crushers",
		setting_type = "runtime-global",
		default_value = false,
		order = "agba"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-crushers",
		setting_type = "runtime-global",
		default_value = 10,
		maximum_value = 50,
		minimum_value = 0,
		order = "agbb"
	}
})
end

if mods["omnimatter"] then
data:extend({
	{
		type = "int-setting",
		name = "uqs-number-of-omnitractors",
		setting_type = "runtime-global",
		default_value = 10,
		maximum_value = 50,
		minimum_value = 0,
		order = "agcb"
	}
})
end

if mods["pycoalprocessing"] then
data:extend({
	{
		type = "int-setting",
		name = "uqs-number-of-plantations",
		setting_type = "runtime-global",
		default_value = 4,
		maximum_value = 20,
		minimum_value = 0,
		order = "aha"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-distilators",
		setting_type = "runtime-global",
		default_value = 1,
		maximum_value = 5,
		minimum_value = 0,
		order = "ahb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-ponds",
		setting_type = "runtime-global",
		default_value = 1,
		maximum_value = 5,
		minimum_value = 0,
		order = "ahc"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-gas-vents",
		setting_type = "runtime-global",
		default_value = 1,
		maximum_value = 5,
		minimum_value = 0,
		order = "ahd"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-crystal-mines",
		setting_type = "runtime-global",
		default_value = 20,
		maximum_value = 100,
		minimum_value = 0,
		order = "ahe"
	}
})
end

if mods["market2"] then
data:extend({
	{
		type = "int-setting",
		name = "uqs-number-of-market-chests",
		setting_type = "runtime-global",
		default_value = 5,
		maximum_value = 10,
		minimum_value = 0,
		order = "aia"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-market-tanks",
		setting_type = "runtime-global",
		default_value = 1,
		maximum_value = 10,
		minimum_value = 0,
		order = "aib"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-market-accumulators",
		setting_type = "runtime-global",
		default_value = 1,
		maximum_value = 10,
		minimum_value = 0,
		order = "aic"
	}
})
end

if mods["Oxygen2_0"] then
data:extend({
	{
		type = "int-setting",
		name = "uqs-number-of-oxygen-bottles",
		setting_type = "runtime-global",
		default_value = 25,
		maximum_value = 100,
		minimum_value = 0,
		order = "aja"
	}
})
end