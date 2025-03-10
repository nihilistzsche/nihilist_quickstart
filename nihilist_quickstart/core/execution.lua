return function(player)
    if nqs.inserternumber and nqs.inserternumber > 0 then
        player.insert({ name = nqs.insertertype, count = nqs.inserternumber })
    end

    -- Inserting belts
    if nqs.beltnumber and nqs.beltnumber > 0 then player.insert({ name = nqs.belttype, count = nqs.beltnumber }) end

    -- Inserting undergrounds
    if nqs.undergroundnumber and nqs.undergroundnumber > 0 then
        player.insert({ name = nqs.undergroundtype, count = nqs.undergroundnumber })
    end

    -- Inserting splitters
    if nqs.splitternumber and nqs.splitternumber > 0 then
        player.insert({ name = nqs.splittertype, count = nqs.splitternumber })
    end

    -- Inserting loaders
    if nqs.loadernumber and nqs.loadernumber > 0 then
        player.insert({ name = nqs.loadertype, count = nqs.loadernumber })
    end

    -- Inserting beltboxes
    if nqs.beltboxnumber and nqs.beltboxnumber > 0 then
        player.insert({ name = nqs.beltboxtype, count = nqs.beltboxnumber })
        player.force.technologies["deadlock-stacking-1"].researched = true
    end

    -- Inserting pipes
    if nqs.pipenumber and nqs.pipenumber > 0 then player.insert({ name = nqs.pipetype, count = nqs.pipenumber }) end

    -- Inserting pipe-to-grounds
    if nqs.pipeundergroundnumber and nqs.pipeundergroundnumber > 0 then
        player.insert({ name = nqs.pipeundergroundtype, count = nqs.pipeundergroundnumber })
    end

    -- Inserting mining drills
    if nqs.minernumber and nqs.minernumber > 0 then player.insert({ name = nqs.minertype, count = nqs.minernumber }) end

    -- Inserting mining drones
    if nqs.minernumber2 and nqs.minernumber2 > 0 and nqs.miningdrones then
        player.insert({ name = nqs.minertype2, count = nqs.minernumber2 })
    end

    -- Inserting labs
    if nqs.labnumber and nqs.labnumber > 0 then player.insert({ name = nqs.labtype, count = nqs.labnumber }) end

    -- Inserting assembling machines
    if nqs.assemblernumber and nqs.assemblernumber > 0 then
        player.insert({ name = nqs.assemblertype, count = nqs.assemblernumber })
    end

    -- Inserting power poles
    if nqs.polenumber and nqs.polenumber > 0 then player.insert({ name = nqs.poletype, count = nqs.polenumber }) end

    -- Inserting Omnitractors
    if nqs.Omnimatter and nqs.omnitractornumber and nqs.omnitractornumber > 0 then
        player.insert({ name = nqs.omnitractortype, count = nqs.omnitractornumber })
    end

    -- Inserting furnaces
    if nqs.furnacenumber and nqs.furnacenumber > 0 then
        player.insert({ name = nqs.furnacetype, count = nqs.furnacenumber })
    end

    if nqs.linkedbeltnumber and nqs.linkedbeltnumber > 0 then
        player.insert({ name = "linked-belt", count = nqs.linkedbeltnumber })
    end

    -- Inserting Market stuff
    if nqs.marketmod then
        if nqs.marketchestsnumber and nqs.marketchestsnumber > 0 then
            player.insert({ name = nqs.marketcheststype, count = nqs.marketchestsnumber })
        end
        if nqs.markettanksnumber and nqs.markettanksnumber > 0 then
            player.insert({ name = nqs.markettankstype, count = nqs.markettanksnumber })
        end
        if nqs.marketaccumulatorsnumber and nqs.marketaccumulatorsnumber > 0 then
            table.insert(
                nqs.insertion_info,
                { name = nqs.marketaccumulatorstype, count = nqs.marketaccumulatorsnumber }
            )
        end
    end

    -- Inserting oxygen stuff
    if nqs.oxygenmod then
        if nqs.oxygenbottlesnumber and nqs.oxygenbottlesnumber > 0 then
            player.insert({ name = nqs.oxygenbottlestype, count = nqs.oxygenbottlesnumber })
        end
    end

    -- Water for power in omnimatter
    if nqs.Omnimatter and nqs.needwater then
        player.insert({ name = "omniphlog-1", count = nqs.numberofwater })
        player.insert({ name = "omnitractor-1", count = nqs.numberofwater })
    end

    if nqs.crushertype and nqs.crushernumber then
        player.insert({ name = nqs.crushertype, count = nqs.crushernumber })
    end
    if nqs.sorternumber and nqs.sorternumber > 0 then
        player.insert({ name = "ore-sorting-facility", count = nqs.sorternumber })
    end
    if nqs.ifurnacenumber and nqs.ifurnacenumber > 0 then
        player.insert({ name = "induction-furnace", count = nqs.ifurnacenumber })
    end
    if nqs.bfurnacenumber and nqs.bfurnacenumber > 0 then
        player.insert({ name = "blast-furnace", count = nqs.bfurnacenumber })
    end
    if nqs.cmachineenumber and nqs.cmachinenumber > 0 then
        player.insert({ name = "casting-machine", count = nqs.cmachinenumber })
    end
    if nqs.chestnumber > 0 then player.insert({ name = "wooden-chest", count = nqs.chestnumber }) end

    if nqs.fuelnumber > 0 then player.insert({ name = nqs.fueltype, count = nqs.fuelnumber }) end

    if nqs.pyCoal then
        if nqs.plantationsnumber > 0 then
            player.insert({ name = "fawogae-plantation", count = nqs.plantationsnumber })
        end
        if nqs.distilatorsnumber > 0 then player.insert({ name = "distilator", count = nqs.distilatorsnumber }) end
        if nqs.pondsnumber > 0 then player.insert({ name = "tailings-pond", count = nqs.pondsnumber }) end
        if nqs.pyIndustry then
            if nqs.gasventsnumber > 0 then player.insert({ name = "py-gas-vent", count = nqs.gasventsnumber }) end
        else
            if nqs.pondsnumber > 0 then player.insert({ name = "tailings-pond", count = 1 }) end
        end
        player.insert({ name = "offshore-pump", count = 1 })
        if nqs.pyOres then
            if nqs.crystalminesnumber > 0 then
                player.insert({ name = "borax-mine", count = nqs.crystalminesnumber })
            end
        end
    end
    -- Checking settings for defensive structures
    local gunturretnumber = nqs.gunturretnumber
    local gunturretammotype = nqs.gunturretammotype
    local gunturretammonumber = nqs.gunturretammonumber

    if gunturretnumber > 0 then
        player.insert({ name = "gun-turret", count = gunturretnumber })
        if gunturretammonumber > 0 then player.insert({ name = gunturretammotype, count = gunturretammonumber }) end
    end
    if nqs.stonewallnumber > 0 then player.insert({ name = "stone-wall", count = nqs.stonewallnumber }) end
    if nqs.gatenumber > 0 then player.insert({ name = "gate", count = nqs.gatenumber }) end

    if nqs.cliffexplosivenumber > 0 then
        player.insert({ name = "cliff-explosives", count = nqs.cliffexplosivenumber })
    end

    for _, v in pairs(nqs.power_setup_info) do
        player.insert({ name = v[1], count = v[2] })
    end
end
