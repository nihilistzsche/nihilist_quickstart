table.insert(nqs_bne.setupFuncs, function(player)
    local armortype
    -- Define variables
    local robotmult
    local powertype
    local batterytype
    local personalroboporttype
    local energyshieldtype

    if settings.global["nqs-armor"].value == "Modular Armor" then
        armortype = "modular-armor"
    elseif settings.global["nqs-armor"].value == "Power Armor" then
        armortype = "power-armor"
    elseif settings.global["nqs-armor"].value == "Power Armor MK2" then
        armortype("power-armor-mk2")
    elseif settings.global["nqs-armor"].value == "Power Armor MK3" then
        armortype = "bob-power-armor-mk3"
    elseif settings.global["nqs-armor"].value == "Power Armor MK4" then
        armortype = "bob-power-armor-mk4"
    elseif settings.global["nqs-armor"].value == "Power Armor MK5" then
        armortype = "bob-power-armor-mk5"
    elseif settings.global["nqs-armor"].value == "Standard YI Suite" then
        armortype = "yi_armor_gray"
    elseif settings.global["nqs-armor"].value == "Master Technic Suite" then
        armortype = "yi_armor_red"
    elseif settings.global["nqs-armor"].value == "Master YI Suite" then
        armortype = "yi_armor_gold"
    elseif settings.global["nqs-armor"].value == "Walker - T.R." then
        armortype = "yi_walker_a"
    elseif settings.global["nqs-armor"].value == "I Am the Walking Death" then
        armortype = "yi_walker_c"
    elseif settings.global["nqs-armor"].value == "Mech Armor" then
        armortype = "mech-armor"
    elseif settings.global["nqs-armor"].value == "None" then
    end
    nqs_bne.armortype = armortype
    -- we need to insert the armor directly here to use the grid
    local inbackpack

    local powersourcetype, fuelcells
    -- Checking power source
    if settings.global["nqs-equipment-power"].value == "Solar panels" then
        powertype = "solar-panel-equipment"
        powersourcetype = 1
    elseif settings.global["nqs-equipment-power"].value == "Solar panels MK2" then
        powertype = "solar-panel-equipment-2"
        powersourcetype = 1
    elseif settings.global["nqs-equipment-power"].value == "Solar panels MK3" then
        powertype = "solar-panel-equipment-3"
        powersourcetype = 1
    elseif settings.global["nqs-equipment-power"].value == "Solar panels MK4" then
        powertype = "solar-panel-equipment-4"
        powersourcetype = 1
    elseif settings.global["nqs-equipment-power"].value == "Portable fission reactors" then
        powertype = "fission-reactor-equipment"
        powersourcetype = 2
    elseif settings.global["nqs-equipment-power"].value == "Portable fusion reactors" then
        powertype = "fusion-reactor-equipment"
        powersourcetype = 2
    elseif settings.global["nqs-equipment-power"].value == "Fusion reactors MK2" then
        powertype = "fusion-reactor-equipment-2"
        powersourcetype = 2
    elseif settings.global["nqs-equipment-power"].value == "Fusion reactors MK3" then
        powertype = "fusion-reactor-equipment-3"
        powersourcetype = 2
    elseif settings.global["nqs-equipment-power"].value == "Fusion reactors MK4" then
        powertype = "fusion-reactor-equipment-4"
        powersourcetype = 2
    elseif settings.global["nqs-equipment-power"].value == "Portable generators" then
        powertype = "portable-generator-equipment"
        powersourcetype = 3
    elseif settings.global["nqs-equipment-power"].value == "Portable reactors" then
        powertype = "portable-reactor-equipment"
        powersourcetype = 4
        fuelcells = settings.global["nqs-number-of-uranium-fuel"].value
    elseif settings.global["nqs-equipment-power"].value == "Personal Tesseract" then
        powertype = "personal-tesseract-1"
        powersourcetype = 1
    elseif settings.global["nqs-equipment-power"].value == "Personal Tesseract Mk2" then
        powertype = "personal-tesseract-2"
        powersourcetype = 1
    elseif settings.global["nqs-equipment-power"].value == "Personal Tesseract Mk3" then
        powertype = "personal-tesseract-3"
        powersourcetype = 1
    elseif settings.global["nqs-equipment-power"].value == "Personal Tesseract Mk4" then
        powertype = "personal-tesseract-4"
        powersourcetype = 1
    end
    local powersources = settings.global["nqs-number-of-panels-reactors"].value
    nqs_bne.powertype = powertype
    nqs_bne.powersourcetype = powersourcetype
    nqs_bne.powersources = powersources
    nqs_bne.fuelcells = fuelcells

    -- Checking settings for battery
    local batteries = settings.global["nqs-number-of-batteries"].value
    if settings.global["nqs-equipment-battery"].value == "Battery" then
        batterytype = "battery-equipment"
    elseif settings.global["nqs-equipment-battery"].value == "Battery MK2" then
        batterytype = "battery-mk2-equipment"
    elseif settings.global["nqs-equipment-battery"].value == "Battery MK3" then
        batterytype = "battery-mk3-equipment"
    elseif settings.global["nqs-equipment-battery"].value == "Battery MK4" then
        batterytype = "battery-mk4-equipment"
    elseif settings.global["nqs-equipment-battery"].value == "Battery MK5" then
        batterytype = "battery-mk5-equipment"
    elseif settings.global["nqs-equipment-battery"].value == "Battery MK6" then
        batterytype = "battery-mk6-equipment"
    elseif settings.global["nqs-equipment-battery"].value == "None" then
        batteries = 0
    end

    nqs_bne.batterytype = batterytype
    nqs_bne.batteries = batteries

    -- Checking settings for roboport
    local roboports = settings.global["nqs-number-of-personal-roboports"].value
    if settings.global["nqs-equipment-personal-roboport"].value == "Roboport" then
        personalroboporttype = "personal-roboport-equipment"
        robotmult = 10
    elseif settings.global["nqs-equipment-personal-roboport"].value == "Roboport MK2" then
        personalroboporttype = "personal-roboport-mk2-equipment"
        if script.active_mods["bobequipment"] then
            robotmult = 15
        else
            robotmult = 25
        end
    elseif settings.global["nqs-equipment-personal-roboport"].value == "None" then
        roboports = 0
    end

    nqs_bne.personalroboporttype = personalroboporttype
    nqs_bne.personalrobotmult = robotmult
    nqs_bne.personalroboports = roboports

    -- Checking settings for exoskeletons
    local exoskeletons = settings.global["nqs-number-of-exoskeletons"].value
    local exoskeletontype
    if settings.global["nqs-equipment-exoskeletons"].value == "Exoskeleton" then
        exoskeletontype = "exoskeleton-equipment"
    elseif settings.global["nqs-equipment-exoskeletons"].value == "Exoskeleton MK2" then
        exoskeletontype = "exoskeleton-equipment-2"
    elseif settings.global["nqs-equipment-exoskeletons"].value == "Exoskeleton MK3" then
        exoskeletontype = "exoskeleton-equipment-3"
    elseif settings.global["nqs-equipment-exoskeletons"].value == "None" then
        exoskeletons = 0
    end

    nqs_bne.exoskeletontype = exoskeletontype
    nqs_bne.exoskeletons = exoskeletons

    -- Checking settings for energy shield
    local energyshields = settings.global["nqs-number-of-energy-shields"].value
    if settings.global["nqs-equipment-energy-shield"].value == "Energy Shield" then
        energyshieldtype = "energy-shield-equipment"
    elseif settings.global["nqs-equipment-energy-shield"].value == "Energy Shield MK2" then
        energyshieldtype = "energy-shield-mk2-equipment"
    elseif settings.global["nqs-equipment-energy-shield"].value == "Energy Shield MK3" then
        energyshieldtype = "energy-shield-mk3-equipment"
    elseif settings.global["nqs-equipment-energy-shield"].value == "Energy Shield MK4" then
        energyshieldtype = "energy-shield-mk4-equipment"
    elseif settings.global["nqs-equipment-energy-shield"].value == "Energy Shield MK5" then
        energyshieldtype = "energy-shield-mk5-equipment"
    elseif settings.global["nqs-equipment-energy-shield"].value == "Energy Shield MK6" then
        energyshieldtype = "energy-shield-mk6-equipment"
    elseif settings.global["nqs-equipment-energy-shield"].value == "None" then
        energyshields = 0
    end

    nqs_bne.energyshieldtype = energyshieldtype
    nqs_bne.energyshields = energyshields

    local dischargedefense
    -- Checking settings for discharge defense
    if settings.global["nqs-equipment-discharge-defense"].value then
        dischargedefense = 1
    else
        dischargedefense = 0
    end

    nqs_bne.dischargedefense = dischargedefense

    -- Checking settings for personal laser defense
    local personallaserdefenses = settings.global["nqs-number-of-personal-laser-defense"].value

    nqs_bne.personallaserdefenses = personallaserdefenses

    if script.active_mods["Oxygen_Patched"] and settings.global["nqs-oxygen-gas-mask"].value then
        nqs_bne.insert_gas_mask = true
    end

    if settings.global["nqs-equipment-night-vision"].value then nqs_bne.insert_night_vision = true end

    if settings.global["nqs-equipment-discharge-defense"].value then nqs_bne.insert_discharge_defense = true end

    if settings.global["nqs-equipment-belt-immunity"].value then nqs_bne.insert_belt_immunity = true end
end)
