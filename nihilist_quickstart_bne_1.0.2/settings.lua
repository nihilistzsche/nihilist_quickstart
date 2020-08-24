-- defining arrays
local roboportsallowed = {}
local robotsmodallowed = {}
local armorallowed = {}
local batteriesallowed = {}
local shieldsallowed = {}
local exoskeletonsallowed = {}
local powerallowed = {}
local ammoallowed = {}
local gunsallowed = {}

-- building arrays Vanilla
table.insert(roboportsallowed, "None")
table.insert(roboportsallowed, "Vanilla")
table.insert(robotsmodallowed, "None")
table.insert(robotsmodallowed, "Vanilla")

table.insert(armorallowed, "None")
table.insert(armorallowed, "Modular Armor")
table.insert(armorallowed, "Power Armor")
table.insert(armorallowed, "Power Armor MK2")

table.insert(batteriesallowed, "None")
table.insert(batteriesallowed, "Battery")
table.insert(batteriesallowed, "Battery MK2")

table.insert(shieldsallowed, "None")
table.insert(shieldsallowed, "Energy Shield")
table.insert(shieldsallowed, "Energy Shield MK2")

table.insert(powerallowed, "Solar panels")
table.insert(powerallowed, "Fusion reactors")

table.insert(exoskeletonsallowed, "None")
table.insert(exoskeletonsallowed, "Exoskeleton")

table.insert(ammoallowed, "None")
table.insert(ammoallowed, "Firearm magazine")
table.insert(ammoallowed, "Piercing rounds")
table.insert(ammoallowed, "Uranium rounds")
table.insert(ammoallowed, "Shotgun shells")
table.insert(ammoallowed, "Piercing shotgun shells")
table.insert(ammoallowed, "Rocket")
table.insert(ammoallowed, "Explosive rocket")
table.insert(ammoallowed, "Atomic bomb")
table.insert(ammoallowed, "Flamethrower ammo")

table.insert(gunsallowed, "Pistol")
table.insert(gunsallowed, "Submachine gun")
table.insert(gunsallowed, "Shotgun")
table.insert(gunsallowed, "Combat shotgun")
table.insert(gunsallowed, "Rocket launcher")
table.insert(gunsallowed, "Flamethrower")

-- building arrays Mods
-- Bob's logistics
if mods["boblogistics"] then
	table.insert(roboportsallowed, "Bob's mk2")
	table.insert(roboportsallowed, "Bob's mk3")
	table.insert(roboportsallowed, "Bob's mk4")
	table.insert(robotsmodallowed, "Bob's mk2")
	table.insert(robotsmodallowed, "Bob's mk3")
	table.insert(robotsmodallowed, "Bob's mk4")
	table.insert(robotsmodallowed, "Bob's fusion mk4")
end

-- Bob's equipment
if mods["bobequipment"] then
	table.insert(powerallowed, "Solar panels MK2")
	table.insert(powerallowed, "Solar panels MK3")
	table.insert(powerallowed, "Solar panels MK4")
	table.insert(powerallowed, "Fusion reactors MK2")
	table.insert(powerallowed, "Fusion reactors MK3")
	table.insert(powerallowed, "Fusion reactors MK4")

	table.insert(batteriesallowed, "Battery MK3")
	table.insert(batteriesallowed, "Battery MK4")
	table.insert(batteriesallowed, "Battery MK5")
	table.insert(batteriesallowed, "Battery MK6")

	table.insert(shieldsallowed, "Energy Shield MK3")
	table.insert(shieldsallowed, "Energy Shield MK4")
	table.insert(shieldsallowed, "Energy Shield MK5")
	table.insert(shieldsallowed, "Energy Shield MK6")

	table.insert(exoskeletonsallowed, "Exoskeleton MK2")
	table.insert(exoskeletonsallowed, "Exoskeleton MK3")
end

-- Bob's warfare
if mods["bobwarfare"] then
	table.insert(armorallowed, "Power Armor MK3")
	table.insert(armorallowed, "Power Armor MK4")
	table.insert(armorallowed, "Power Armor MK5")
end

-- Pyanodons Hightech
if mods["pyhightech"] then
	table.insert(robotsmodallowed, "Pyanodons hightech")
end

-- Pyanodons Industry
if mods["pyindustry"] then
	table.insert(roboportsallowed, "Pyanodons industry")
	table.insert(robotsmodallowed, "Pyanodons industry")
end

-- Yuoki Industries
if mods["Yuoki"] then
	table.insert(roboportsallowed, "Yuoki industries")
	table.insert(robotsmodallowed, "Yuoki industries")
	table.insert(armorallowed, "Standard YI Suite")
	table.insert(armorallowed, "Master Technic Suite")
	table.insert(armorallowed, "Master YI Suite")
	table.insert(armorallowed, "Walker - T.R.")
	table.insert(armorallowed, "I Am the Walking Death")
end

-- Portable Power
if mods["Portable_power"] then
	table.insert(powerallowed, "Portable generators")
	table.insert(powerallowed, "Portable reactors")
end

-- Oxygen 2.0
if mods["Oxygen2_0"] then
data:extend({
	{
		type = "bool-setting",
		name = "uqs-oxygen-gas-mask",
		setting_type = "runtime-global",
		default_value = true,
		order = "aja"
	}
})
end

-- Create settings
-- Mod-dependent
if mods["Portable_power"] then
data:extend({
	{
		type = "int-setting",
		name = "uqs-number-of-uranium-fuel",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 250,
		minimum_value = 1,
		order = "aibb"
	}
})
end

-- General settings
data:extend({
	{
		type = "string-setting",
		name = "uqs-robots-mod",
		setting_type = "runtime-global",
		default_value = "Vanilla",
		allowed_values = robotsmodallowed,
		order = "aadb"
	},
	{
		type = "string-setting",
		name = "uqs-type-of-roboports",
		setting_type = "runtime-global",
		default_value = "Vanilla",
		allowed_values = roboportsallowed,
		order = "aaaa"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-roboports",
		setting_type = "runtime-global",
		default_value = 10,
		maximum_value = 50,
		minimum_value = 0,
		order = "aada"
	},
	{
		type = "bool-setting",
		name = "uqs-provide-robots-alone",
		setting_type = "runtime-global",
		default_value = false,
		order = "aadb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-logistic-robots",
		setting_type = "runtime-global",
		default_value = 250,
		maximum_value = 1000,
		minimum_value = 0,
		order = "aaeb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-construction-robots",
		setting_type = "runtime-global",
		default_value = 100,
		maximum_value = 250,
		minimum_value = 0,
		order = "aafa"
	},
	{
		type = "bool-setting",
		name = "uqs-provide-chests-alone",
		setting_type = "runtime-global",
		default_value = false,
		order = "aafb"
	},
	{
		type = "bool-setting",
		name = "uqs-provide-active-providers",
		setting_type = "runtime-global",
		default_value = true,
		order = "aaga"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-provider-chests",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 100,
		minimum_value = 0,
		order = "aagb"
	},
	{
		type = "bool-setting",
		name = "uqs-provide-buffers",
		setting_type = "runtime-global",
		default_value = true,
		order = "aahb"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-requester-chests",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 100,
		minimum_value = 0,
		order = "aaha"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-storage-chests",
		setting_type = "runtime-global",
		default_value = 50,
		maximum_value = 100,
		minimum_value = 0,
		order = "aai"
	},
	{
		type = "string-setting",
		name = "uqs-armor",
		setting_type = "runtime-global",
		default_value = "None",
		allowed_values = armorallowed,
		order = "aiaa"
	},
	{
		type = "bool-setting",
		name = "uqs-equipment-in-backpack",
		setting_type = "runtime-global",
		default_value = false,
		order = "aiab"
	},
	{
		type = "string-setting",
		name = "uqs-equipment-power",
		setting_type = "runtime-global",
		default_value = "Solar panels",
		allowed_values = powerallowed,
		order = "aiba"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-panels-reactors",
		setting_type = "runtime-global",
		default_value = 1,
		maximum_value = 50,
		minimum_value = 0,
		order = "aibc"
	},
	{
		type = "string-setting",
		name = "uqs-equipment-battery",
		setting_type = "runtime-global",
		default_value = "Battery",
		allowed_values = batteriesallowed,
		order = "aica"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-batteries",
		setting_type = "runtime-global",
		default_value = 1,
		maximum_value = 10,
		minimum_value = 0,
		order = "aicb"
	},
	{
		type = "bool-setting",
		name = "uqs-equipment-night-vision",
		setting_type = "runtime-global",
		default_value = false,
		order = "aid"
	},
	{
		type = "string-setting",
		name = "uqs-equipment-personal-roboport",
		setting_type = "runtime-global",
		default_value = "Roboport",
		allowed_values = {"Roboport", "Roboport MK2"},
		order = "aiea"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-personal-roboports",
		setting_type = "runtime-global",
		default_value = 2,
		maximum_value = 10,
		minimum_value = 0,
		order = "aieb"
	},
	{
		type = "bool-setting",
		name = "uqs-supply-robots",
		setting_type = "runtime-global",
		default_value = true,
		order = "aiec"
	},
	{
		type = "string-setting",
		name = "uqs-equipment-exoskeletons",
		setting_type = "runtime-global",
		default_value = "Exoskeleton",
		allowed_values = exoskeletonsallowed,
		order = "aifa"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-exoskeletons",
		setting_type = "runtime-global",
		default_value = 0,
		maximum_value = 10,
		minimum_value = 0,
		order = "aifb"
	},
	{
		type = "string-setting",
		name = "uqs-equipment-energy-shield",
		setting_type = "runtime-global",
		default_value = "Energy Shield",
		allowed_values = shieldsallowed,
		order = "aiga"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-energy-shields",
		setting_type = "runtime-global",
		default_value = 0,
		maximum_value = 10,
		minimum_value = 0,
		order = "aigb"
	},
	{
		type = "bool-setting",
		name = "uqs-equipment-belt-immunity",
		setting_type = "runtime-global",
		default_value = false,
		order = "aih"
	},
	{
		type = "bool-setting",
		name = "uqs-equipment-discharge-defense",
		setting_type = "runtime-global",
		default_value = false,
		order = "aii"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-personal-laser-defense",
		setting_type = "runtime-global",
		default_value = 0,
		maximum_value = 10,
		minimum_value = 0,
		order = "aij"
	},
	{
		type = "bool-setting",
		name = "uqs-equipment-solar-fill",
		setting_type = "runtime-global",
		default_value = true,
		order = "aik"
	},
	{
		type = "bool-setting",
		name = "uqs-equipment-gun-provide",
		setting_type = "runtime-global",
		default_value = true,
		order = "aila"
	},
	{
		type = "string-setting",
		name = "uqs-equipment-gun",
		setting_type = "runtime-global",
		default_value = "Pistol",
		allowed_values = gunsallowed,
		order = "ailb"
	},
	{
		type = "string-setting",
		name = "uqs-equipment-ammo",
		setting_type = "runtime-global",
		default_value = "Firearm magazine",
		allowed_values = ammoallowed,
		order = "aim"
	},
	{
		type = "int-setting",
		name = "uqs-number-of-ammo",
		setting_type = "runtime-global",
		default_value = 10,
		maximum_value = 1000,
		minimum_value = 0,
		order = "ain"
	},
	{
		type = "string-setting",
		name = "uqs-custom-entities",
		setting_type = "runtime-global",
		default_value = "iron-plate:1 copper-plate:1",
		allow_blank = true,
		order = "baa"
	}
})