table.insert(nqs.setupFuncs, function()
    -- Check settings for mining drills
    local minernumber
    local minernumber2
    local minertype, minertype2
    if settings.global["nqs-miner-type"].value == "Burner mining drills" then
        minertype = "burner-mining-drill"
        minernumber = settings.global["nqs-number-of-miners"].value
    elseif settings.global["nqs-miner-type"].value == "Electric mining drills" then
        minertype = "electric-mining-drill"
        minernumber = settings.global["nqs-number-of-miners"].value
    elseif settings.global["nqs-miner-type"].value == "Mining Drones" then
        minertype = "mining-depot"
        minernumber = settings.global["nqs-number-of-mining-depots"].value
        minertype2 = "mining-drone"
        minernumber2 = settings.global["nqs-number-of-mining-drones"].value
        nqs.miningdrones = true
    else
        minernumber = 0
    end
    nqs.minernumber = minernumber
    nqs.minernumber2 = minernumber2
    nqs.minertype = minertype
    nqs.minertype2 = minertype2

    -- Check settings for labs and assemblers
    -- Settings default balues
    nqs.labtype = "lab"
    nqs.labnumber = settings.global["nqs-number-of-labs"].value
    nqs.assemblertype = "assembling-machine-1"
    nqs.assemblernumber = settings.global["nqs-number-of-assemblers"].value

    if settings.global["nqs-labs-assemblers"].value == "AAII Burner" then
        nqs.labtype = "burner-lab"
        nqs.labnumber = settings.global["nqs-number-of-labs"].value
        nqs.assemblertype = "burner-assembling-machine"
        nqs.assemblernumber = settings.global["nqs-number-of-assemblers"].value
    elseif settings.global["nqs-labs-assemblers"].value == "Amator Phasma's Burner" then
        nqs.labtype = "apm_lab_0"
        nqs.labnumber = settings.global["nqs-number-of-labs"].value
        nqs.assemblertype = "apm_assembling_machine_0"
        nqs.assemblernumber = settings.global["nqs-number-of-assemblers"].value
    elseif settings.global["nqs-labs-assemblers"].value == "Electric" then
        nqs.labtype = "lab"
        nqs.labnumber = settings.global["nqs-number-of-labs"].value
        nqs.assemblertype = "assembling-machine-1"
        nqs.assemblernumber = settings.global["nqs-number-of-assemblers"].value
    elseif settings.global["nqs-labs-assemblers"].value == "None" then
        nqs.labtype = "lab"
        nqs.labnumber = 0
        nqs.assemblertype = "assembling-machine-1"
        nqs.assemblernumber = 0
    end

    -- Checking settings for power poles
    nqs.poletype = "small-electric-pole"
    nqs.polenumber = settings.global["nqs-number-of-poles"].value

    if nqs.AAII and settings.global["nqs-aai-power-poles"] then nqs.poletype = "small-iron-electric-pole" end

    -- Check settings for furnaces
    nqs.furnacenumber = settings.global["nqs-number-of-furnaces"].value

    local furnacetype
    if nqs.minimachines and settings.global["nqs-mini-furnaces"].value then
        furnacetype = "mini-furnace-1"
    elseif nqs.electricfurnaces and settings.global["nqs-electric-furnaces"].value then
        furnacetype = "electric-stone-furnace"
    else
        furnacetype = "stone-furnace"
    end
    nqs.furnacetype = furnacetype

    local boilertype
    if nqs.electricboiler and settings.global["nqs-provide-electric-boilers"].value then
        boilertype = "electric-boiler"
    else
        boilertype = "boiler"
    end
    nqs.boilertype = boilertype
end)
