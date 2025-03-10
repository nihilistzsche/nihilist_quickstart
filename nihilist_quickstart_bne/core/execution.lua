return function(player)
    if nqs_bne.armortype then player.insert({ name = nqs_bne.armortype, count = 1 }) end
    -- Checking whether to put equipment in inventory or grid

    -- Handle inventory operations first
    if not nqs_bne.armortype then
        if nqs_bne.batteries > 0 then player.insert({ name = nqs_bne.batterytype, count = nqs_bne.batteries }) end

        if nqs_bne.insert_gas_mask then player.insert({ name = "gas-mask", count = 1 }) end

        -- Night vision in backpack
        if nqs_bne.insert_night_vision then player.insert({ name = "night-vision-equipment", count = 1 }) end

        if nqs_bne.personalroboportype and nqs_bne.personalroboports > 0 then
            player.insert({ name = nqs_bne.personalroboporttype, nqs_bne.personalroboports })
            player.insert({ name = nqs_bne.conbots, count = nqs_bne.personalroboports * nqs_bne.personalrobotmult })
        end

        -- Exoskeletons in backpack
        if nqs_bne.exoskeletons > 0 then
            player.insert({ name = nqs_bne.exoskeletontype, count = nqs_bne.exoskeletons })
        end

        -- Energy shields in backpack
        if nqs_bne.energyshields > 0 then
            player.insert({ name = nqs_bne.energyshieldtype, count = nqs_bne.energyshields })
        end

        -- Discharge defense in backpack
        if nqs_bne.insert_discharge_defense then player.insert({ name = "discharge-defense-equipment", count = 1 }) end

        -- Personal laser defense in backpack
        if nqs_bne.personallaserdefenses > 0 then
            player.insert({ name = "personal-laser-defense-equipment", count = nqs_bne.personallaserdefenses })
        end

        -- Belt immunity in backpack
        if nqs_bne.insert_belt_immunity then player.insert({ name = "belt-immunity-equipment", count = 1 }) end
    else
        -- Armor generation
        local function findArmorGrid()
            local function isInventoryValid(inv) return inv and inv.valid and not inv.is_empty() end
            local function isArmorValid(item)
                return item and item.valid and item.valid_for_read and item.is_armor and item.grid
            end

            local firstInv = player.get_inventory(defines.inventory.character_armor)
            if isInventoryValid(firstInv) then
                for k = #firstInv, 1, -1 do
                    local v = firstInv[k]
                    if isArmorValid(v) then return v.grid end
                end
            end

            local secondInv = player.get_main_inventory()
            if isInventoryValid(secondInv) then
                for k = #secondInv, 1, -1 do
                    local v = secondInv[k]
                    if isArmorValid(v) then return v.grid end
                end
            end
        end
        local gridmt = {}
        local grid = findArmorGrid()
        local gridwidth = grid.width
        local gridheight = grid.height
        -- Reserve original amount of roboports
        local roboportsoriginal = nqs_bne.personalroboports
        -- Create gridmatrix
        for x = 0, (gridheight - 1) do
            gridmt[x] = {}
            for y = 0, (gridwidth - 1) do
                gridmt[x][y] = 0
            end
        end
        local w, h

        for j = 0, (gridwidth - 1) do
            for i = 0, (gridheight - 1) do
                -- Solar Panels and Fusion Reactors
                if nqs_bne.powersources > 0 and gridmt[j][i] == 0 then
                    if nqs_bne.powersourcetype == 1 then
                        grid.put({ name = nqs_bne.powertype, position = { j, i } })
                        nqs_bne.powersources = nqs_bne.powersources - 1
                        gridmt[j][i] = 1
                    elseif nqs_bne.powersourcetype == 2 then
                        w = j + 3
                        h = i + 3
                        if gridwidth > w and gridheight > h then
                            grid.put({ name = nqs_bne.powertype, position = { j, i } })
                            nqs_bne.powersources = nqs_bne.powersources - 1
                            for k = j, w do
                                for l = i, h do
                                    gridmt[k][l] = 1
                                end
                            end
                        end
                    elseif nqs_bne.powersourcetype == 3 then
                        w = j + 1
                        h = i + 2
                        if gridwidth > w and gridheight > h then
                            grid.put({ name = nqs_bne.powertype, position = { j, i } })
                            nqs_bne.powersources = nqs_bne.powersources - 1
                            for k = j, w do
                                for l = i, h do
                                    gridmt[k][l] = 1
                                end
                            end
                        end
                    elseif nqs_bne.powersourcetype == 4 then
                        w = j + 3
                        h = i + 3
                        if gridwidth > w and gridheight > h then
                            grid.put({ name = nqs_bne.powertype, position = { j, i } })
                            nqs_bne.powersources = nqs_bne.powersources - 1
                            if nqs_bne.fuelcells > 0 then
                                player.insert({ name = "uranium-fuel-cell", count = nqs_bne.fuelcells })
                            end
                            for k = j, w do
                                for l = i, h do
                                    gridmt[k][l] = 1
                                end
                            end
                        end
                    end
                end

                -- Batteries
                if nqs_bne.batteries > 0 and gridmt[j][i] == 0 then
                    w = j
                    h = i + 1
                    if gridheight > h then
                        grid.put({ name = nqs_bne.batterytype, position = { j, i } })
                        nqs_bne.batteries = nqs_bne.batteries - 1
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end
                -- Oxygen Gas Mask
                if nqs_bne.insert_gas_mask and gridmt[j][i] == 0 then
                    w = j + 1
                    h = i + 1
                    if gridwidth > w and gridheight > h then
                        grid.put({ name = "gas-mask", position = { j, i } })
                        nqs_bne.insert_gas_mask = nil
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end

                -- Night Vision
                if nqs_bne.insert_night_vision and gridmt[j][i] == 0 then
                    w = j + 1
                    h = i + 1
                    if gridwidth > w and gridheight > h then
                        grid.put({ name = "night-vision-equipment", position = { j, i } })
                        nqs_bne.insert_night_vision = nil
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end

                -- Personal roboports
                if nqs_bne.personalroboports > 0 and gridmt[j][i] == 0 then
                    w = j + 1
                    h = i + 1
                    if gridwidth > w and gridheight > h then
                        grid.put({ name = nqs_bne.personalroboporttype, position = { j, i } })
                        nqs_bne.personalroboports = nqs_bne.personalroboports - 1
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end

                -- Exoskeletons
                if nqs_bne.exoskeletons > 0 and gridmt[j][i] == 0 then
                    w = j + 1
                    h = i + 3
                    if gridwidth > w and gridheight > h then
                        grid.put({ name = nqs_bne.exoskeletontype, position = { j, i } })
                        nqs_bne.exoskeletons = nqs_bne.exoskeletons - 1
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end

                -- Personal energyshields
                if nqs_bne.energyshields > 0 and gridmt[j][i] == 0 then
                    w = j + 1
                    h = i + 1
                    if gridwidth > w and gridheight > h then
                        grid.put({ name = nqs_bne.energyshieldtype, position = { j, i } })
                        nqs_bne.energyshields = nqs_bne.energyshields - 1
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end

                -- Discharge Defense
                if nqs_bne.dischargedefense > 0 and gridmt[j][i] == 0 then
                    w = j + 1
                    h = i + 1
                    if gridwidth > w and gridheight > h then
                        grid.put({ name = "discharge-defense-equipment", position = { j, i } })
                        nqs_bne.dischargedefense = nqs_bne.dischargedefense - 1
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end

                -- Personal Laser Defense
                if nqs_bne.personallaserdefenses > 0 and gridmt[j][i] == 0 then
                    w = j + 1
                    h = i + 1
                    if gridwidth > w and gridheight > h then
                        grid.put({ name = "personal-laser-defense-equipment", position = { j, i } })
                        personallaserdefenses = personallaserdefenses - 1
                        for k = j, w do
                            for l = i, h do
                                gridmt[k][l] = 1
                            end
                        end
                    end
                end

                -- Belt Immunity Equipment
                if nqs_bne.insert_belt_immunity and gridmt[j][i] == 0 then
                    grid.put({ name = "belt-immunity-equipment", position = { j, i } })
                    nqs_bne.insert_belt_immunity = nil
                    gridmt[j][i] = 1
                end
            end
        end
        for j = 0, (gridwidth - 1) do
            for i = 0, (gridheight - 1) do
                -- Fill empty with solar panels
                if settings.global["nqs-equipment-solar-fill"].value and grid.get({ j, i }) == nil then
                    grid.put({
                        name = nqs_bne.powersourcetype == 1 and nqs_bne.powertype or "solar-panel-equipment",
                        position = { j, i },
                    })
                end
            end
        end
        local roboportsinserted = roboportsoriginal - nqs_bne.personalroboports
        if settings.global["nqs-supply-robots"].value and roboportsinserted > 0 then
            player.insert({ name = nqs_bne.conbots, count = roboportsinserted * nqs_bne.personalrobotmult })
        end

        if nqs_bne.giverobots then
            if nqs_bne.logbotsnumber > 0 then
                player.insert({ name = nqs_bne.logbots, count = nqs_bne.logbotsnumber })
            end
            if nqs_bne.conbotsnumber > 0 then
                player.insert({ name = nqs_bne.conbots, count = nqs_bne.conbotsnumber })
            end
        end

        if nqs_bne.givechests then
            if nqs_bne.requesternumber > 0 then
                player.insert({ name = "requester-chest", count = nqs_bne.requesternumber })
            end
            if nqs_bne.providernumber > 0 then
                if settings.global["nqs-provide-active-providers"].value then
                    player.insert({ name = "active-provider-chest", count = math.floor(nqs_bne.providernumber / 2) })
                    player.insert({ name = "passive-provider-chest", count = math.floor(nqs_bne.providernumber / 2) })
                else
                    player.insert({ name = "passive-provider-chest", count = nqs_bne.providernumber })
                end
            end
            if nqs_bne.storagenumber > 0 then
                if settings.global["nqs-provide-buffers"].value then
                    player.insert({ name = "buffer-chest", count = math.floor(nqs_bne.storagenumber / 2) })
                    player.insert({ name = "storage-chest", count = math.floor(nqs_bne.storagenumber / 2) })
                else
                    player.insert({ name = "storage-chest", count = nqs_bne.storagenumber })
                end
            end
        end
    end
    -- Guns and ammo
    if nqs_bne.guntype then player.insert({ name = nqs_bne.guntype, count = 1 }) end

    if nqs_bne.ammotype then player.insert({ name = nqs_bne.ammotype, count = nqs_bne.ammonumber }) end
end
