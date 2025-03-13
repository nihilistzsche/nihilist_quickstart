local data = _G["data"]
local mods = _G["mods"]
-- Defining arrays
local inserters = {}
local pipes = {}
local mining_drills = {}
local power_production = {}
local loaders = {}
local assemblers = {}
local ammo = {}
local fuel = { "Wood", "Coal", "Solid Fuel", "None" }

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

if mods["omnimatter_energy"] then table.insert(fuel, 4, "Purified Omnite") end
if mods["Krastorio2"] then table.insert(fuel, 4, "Processed Fuel") end

data:extend({
    {
        type = "bool-setting",
        name = "nqs-clear-inventory",
        setting_type = "runtime-global",
        default_value = true,
        order = "aaaa",
    },
    {
        type = "string-setting",
        name = "nqs-inserter-type",
        setting_type = "runtime-global",
        default_value = "Burner only",
        allowed_values = inserters,
        order = "aaab",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-inserters",
        setting_type = "runtime-global",
        default_value = 200,
        maximum_value = 2000,
        minimum_value = 0,
        order = "aab",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-belts",
        setting_type = "runtime-global",
        default_value = 1000,
        maximum_value = 18000,
        minimum_value = 0,
        order = "abb",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-undergrounds",
        setting_type = "runtime-global",
        default_value = 50,
        maximum_value = 2000,
        minimum_value = 0,
        order = "abc",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-splitters",
        setting_type = "runtime-global",
        default_value = 50,
        maximum_value = 2000,
        minimum_value = 0,
        order = "abd",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-pipes",
        setting_type = "runtime-global",
        default_value = 100,
        maximum_value = 1000,
        minimum_value = 0,
        order = "acb",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-pipe-undergrounds",
        setting_type = "runtime-global",
        default_value = 50,
        maximum_value = 750,
        minimum_value = 0,
        order = "acc",
    },
    {
        type = "string-setting",
        name = "nqs-miner-type",
        setting_type = "runtime-global",
        default_value = "Burner mining drills",
        allowed_values = mining_drills,
        order = "ada",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-miners",
        setting_type = "runtime-global",
        default_value = 100,
        maximum_value = 500,
        minimum_value = 0,
        order = "adb",
    },
    {
        type = "string-setting",
        name = "nqs-labs-assemblers",
        setting_type = "runtime-global",
        default_value = "Electric",
        allowed_values = assemblers,
        order = "aea",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-labs",
        setting_type = "runtime-global",
        default_value = 4,
        maximum_value = 200,
        minimum_value = 0,
        order = "aeb",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-assemblers",
        setting_type = "runtime-global",
        default_value = 10,
        maximum_value = 1000,
        minimum_value = 0,
        order = "aed",
    },
    {
        type = "string-setting",
        name = "nqs-power-type",
        setting_type = "runtime-global",
        default_value = "Steam Power",
        allowed_values = power_production,
        order = "afa",
    },
    {
        type = "double-setting",
        name = "nqs-desired-power-output",
        setting_type = "runtime-global",
        default_value = 7.2,
        maximum_value = 144,
        minimum_value = 0,
        order = "afb",
    },
    {
        type = "bool-setting",
        name = "nqs-provide-accumulators",
        setting_type = "runtime-global",
        default_value = true,
        order = "afc",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-poles",
        setting_type = "runtime-global",
        default_value = 200,
        maximum_value = 1500,
        minimum_value = 0,
        order = "afh",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-furnaces",
        setting_type = "runtime-global",
        default_value = 50,
        maximum_value = 1500,
        minimum_value = 0,
        order = "agb",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-chests",
        setting_type = "runtime-global",
        default_value = 50,
        maximum_value = 1000,
        minimum_value = 0,
        order = "agd",
    },
    {
        type = "string-setting",
        name = "nqs-fuel-type",
        setting_type = "runtime-global",
        default_value = "Coal",
        allowed_values = fuel,
        order = "age",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-fuel",
        setting_type = "runtime-global",
        default_value = 50,
        maximum_value = 5000,
        minimum_value = 0,
        order = "agf",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-cliff-explosives",
        setting_type = "runtime-global",
        default_value = 20,
        maximum_value = 1000,
        minimum_value = 0,
        order = "agg",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-gun-turrets",
        setting_type = "runtime-global",
        default_value = 0,
        maximum_value = 100,
        minimum_value = 0,
        order = "aha",
    },
    {
        type = "string-setting",
        name = "nqs-type-of-gun-turret-ammo",
        setting_type = "runtime-global",
        default_value = "Firearm magazine",
        allowed_values = ammo,
        order = "ahb",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-gun-turret-ammo",
        setting_type = "runtime-global",
        default_value = 20,
        maximum_value = 200,
        minimum_value = 0,
        order = "ahc",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-stone-walls",
        setting_type = "runtime-global",
        default_value = 200,
        maximum_value = 5000,
        minimum_value = 0,
        order = "ahd",
    },
    {
        type = "int-setting",
        name = "nqs-number-of-gates",
        setting_type = "runtime-global",
        default_value = 20,
        maximum_value = 500,
        minimum_value = 0,
        order = "ahe",
    },
})

if mods["deadlock-beltboxes-loaders"] then table.insert(loaders, "Deadlock's Loaders") end

if mods["vanilla-loaders-hd"] then table.insert(loaders, "Vanilla Loaders HD") end

if mods["miniloader"] then table.insert(loaders, "Miniloaders") end

if mods["aai-loaders"] then table.insert(loaders, "AAI Loaders") end

if #loaders > 1 then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-use-basic-loaders",
            setting_type = "runtime-global",
            default_value = true,
            order = "abeb",
        },
        {
            type = "string-setting",
            name = "nqs-loader-type",
            setting_type = "runtime-global",
            default_value = "None",
            allowed_values = loaders,
            order = "abea",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-loaders",
            setting_type = "runtime-global",
            default_value = 50,
            maximum_value = 1000,
            minimum_value = 0,
            order = "abec",
        },
    })
end

if mods["Mining_Drones"] or mods["Upgradable_Mining_Drones"] then
    table.insert(mining_drills, "Mining Drones")

    local max_drones = 10000
    if mods["mining_drones_overloaded"] then max_drones = 50 * 65536 end
    data:extend({
        {
            type = "int-setting",
            name = "nqs-number-of-mining-depots",
            setting_type = "runtime-global",
            default_value = 5,
            maximum_value = 50,
            minimum_value = 0,
            order = "adab",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-mining-drones",
            setting_type = "runtime-global",
            default_value = 100,
            maximum_value = max_drones,
            minimum_value = 0,
            order = "adac",
        },
    })
end

if mods["Electric Furnaces"] then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-electric-furnaces",
            setting_type = "runtime-global",
            default_value = true,
            order = "aga",
        },
    })
end

if mods["mini-machines"] then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-mini-furnaces",
            setting_type = "runtime-global",
            default_value = true,
            order = "agb",
        },
    })
end

if mods["boblogistics"] then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-bob-belts",
            setting_type = "runtime-global",
            default_value = true,
            order = "aba",
        },
    })
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-bob-pipes",
            setting_type = "runtime-global",
            default_value = true,
            order = "aca",
        },
    })
end

if mods["wood-logistics"] then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-wood-belts",
            setting_type = "runtime-global",
            default_value = true,
            order = "aba",
        },
    })
end

if mods["aai-industry"] then
    table.insert(power_production, "AAII Burner Turbines")
    table.insert(power_production, "AAII Steam Power")
    table.insert(assemblers, "AAII Burner")

    data:extend({
        {
            type = "bool-setting",
            name = "nqs-aai-power-poles",
            setting_type = "runtime-global",
            default_value = true,
            order = "afg",
        },
    })
end

if mods["apm_power"] then table.insert(assemblers, "Amator Phasma's Burner") end

if mods["CW-thermal-solar-power"] then
    table.insert(power_production, "Thermal Solar Power")

    data:extend({
        {
            type = "bool-setting",
            name = "nqs-provide-steam-battery",
            setting_type = "runtime-global",
            default_value = true,
            order = "afd",
        },
        {
            type = "bool-setting",
            name = "nqs-provide-heat-accumulators",
            setting_type = "runtime-global",
            default_value = false,
            order = "afe",
        },
    })
end

if mods["electricboiler"] then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-provide-electric-boilers",
            setting_type = "runtime-global",
            default_value = false,
            order = "aff",
        },
    })
end

if mods["angelsrefining"] then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-type-of-crushers",
            setting_type = "runtime-global",
            default_value = false,
            order = "agba",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-crushers",
            setting_type = "runtime-global",
            default_value = 10,
            maximum_value = 500,
            minimum_value = 0,
            order = "agbb",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-sorters",
            setting_type = "runtime-global",
            default_value = 10,
            maximum_value = 500,
            order = "agbc",
        },
    })
end
if mods["angelssmelting"] then
    data:extend({
        {
            type = "int-setting",
            name = "nqs-number-of-induction-furnaces",
            setting_type = "runtime-global",
            default_value = 10,
            maximum_value = 500,
            order = "agbd",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-blast-furnaces",
            setting_type = "runtime-global",
            default_value = 10,
            maximum_value = 500,
            order = "agbe",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-casting-machines",
            setting_type = "runtime-global",
            default_value = 10,
            maximum_value = 500,
            order = "agbf",
        },
    })
end
if mods["omnimatter"] then
    data:extend({
        {
            type = "bool-setting",
            name = "nqs-provide-electric-omnitractors",
            setting_type = "runtime-global",
            default_value = false,
            order = "agca",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-omnitractors",
            setting_type = "runtime-global",
            default_value = 10,
            maximum_value = 1000,
            minimum_value = 0,
            order = "agcb",
        },
    })
end

if mods["pycoalprocessing"] then
    data:extend({
        {
            type = "int-setting",
            name = "nqs-number-of-plantations",
            setting_type = "runtime-global",
            default_value = 4,
            maximum_value = 20,
            minimum_value = 0,
            order = "aha",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-distilators",
            setting_type = "runtime-global",
            default_value = 1,
            maximum_value = 5,
            minimum_value = 0,
            order = "ahb",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-ponds",
            setting_type = "runtime-global",
            default_value = 1,
            maximum_value = 5,
            minimum_value = 0,
            order = "ahc",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-gas-vents",
            setting_type = "runtime-global",
            default_value = 1,
            maximum_value = 5,
            minimum_value = 0,
            order = "ahd",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-crystal-mines",
            setting_type = "runtime-global",
            default_value = 20,
            maximum_value = 100,
            minimum_value = 0,
            order = "ahe",
        },
    })
end

if mods["market2"] then
    data:extend({
        {
            type = "int-setting",
            name = "nqs-number-of-market-chests",
            setting_type = "runtime-global",
            default_value = 5,
            maximum_value = 10,
            minimum_value = 0,
            order = "aia",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-market-tanks",
            setting_type = "runtime-global",
            default_value = 1,
            maximum_value = 10,
            minimum_value = 0,
            order = "aib",
        },
        {
            type = "int-setting",
            name = "nqs-number-of-market-accumulators",
            setting_type = "runtime-global",
            default_value = 1,
            maximum_value = 10,
            minimum_value = 0,
            order = "aic",
        },
    })
end

if mods["Oxygen_Patched"] then
    data:extend({
        {
            type = "int-setting",
            name = "nqs-number-of-oxygen-bottles",
            setting_type = "runtime-global",
            default_value = 25,
            maximum_value = 100,
            minimum_value = 0,
            order = "aja",
        },
    })
end
if mods["Krastorio2"] then
    data:extend({
        {
            type = "int-setting",
            name = "nqs-number-of-crushers",
            setting_type = "runtime-global",
            default_value = 5,
            maximum_value = 25,
            minimum_value = 0,
            order = "ajb",
        },
    })
end
if mods["LinkedBelts"] then
    data:extend({
        {
            type = "int-setting",
            name = "nqs-number-of-linked-belts",
            setting_type = "runtime-global",
            default_value = 10,
            maximum_value = 100,
            minimum_value = 0,
            order = "ajc",
        },
    })
end
