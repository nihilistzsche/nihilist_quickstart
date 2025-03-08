table.insert(nqs.setupFuncs, function()
    -- luacheck: push no max comment line length
    -- Checking settings for power structures
    -- Check for settings "AAII Burner Turbines", "AAII Steam Power", "Steam Power", "Thermal Solar Power", "Solar Panels", "None"
    -- luacheck: pop
    local desiredpoweroutput = settings.global["nqs-desired-power-output"].value
    nqs.power_setup_info = {}
    local generators
    if desiredpoweroutput > 0 then
        nqs.desiredpoweroutput = desiredpoweroutput
        if settings.global["nqs-power-type"].value == "AAII Burner Turbines" then
            if nqs.AAII then
                generators = math.floor(settings.global["nqs-desired-power-output"].value / 2 + 0.99)
                table.insert(nqs.power_setup_info, { "burner-turbine", generators })
                if settings.global["nqs-electric-inserters"].value then
                    table.insert(nqs.power_setup_info, { "inserter", math.floor(generators * 4) })
                else
                    table.insert(nqs.power_setup_info, { "burner-inserter", math.floor(generators * 4) })
                end
            else
                generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
                table.insert(nqs.power_setup_info, { nqs.boilertype, generators })
                table.insert(nqs.power_setup_info, { "steam-engine", generators * 2 })
                table.insert(nqs.power_setup_info, { "offshore-pump", math.floor(generators / 20 + 0.99) })
                if settings.global["nqs-electric-inserters"].value then
                    table.insert(nqs.power_setup_info, { "inserter", generators })
                else
                    table.insert(nqs.power_setup_info, { "burner-inserter", generators })
                end
            end
        elseif settings.global["nqs-power-type"].value == "AAII Steam Power" then
            nqs.needwater = true
            if nqs.AAII then
                table.insert(nqs.power_setup_info, { "burner-turbine", 1 })
                generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
                table.insert(nqs.power_setup_info, { nqs.boilertype, generators })
                table.insert(nqs.power_setup_info, { "steam-engine", generators * 2 })
                table.insert(nqs.power_setup_info, { "offshore-pump", math.floor(generators / 20 + 0.99) })
                if settings.global["nqs-electric-inserters"].value then
                    table.insert(nqs.power_setup_info, { "inserter", generators + 4 })
                else
                    table.insert(nqs.power_setup_info, { "burner-inserter", generators + 4 })
                end
            else
                generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
                table.insert(nqs.power_setup_info, { nqs.boilertype, generators })
                table.insert(nqs.power_setup_info, { "steam-engine", generators * 2 })
                table.insert(nqs.power_setup_info, { "offshore-pump", math.floor(generators / 20 + 0.99) })
                if settings.global["nqs-electric-inserters"].value then
                    table.insert(nqs.power_setup_info, { "inserter", generators })
                else
                    table.insert(nqs.power_setup_info, { "burner-inserter", generators })
                end
            end
        elseif settings.global["nqs-power-type"].value == "Steam Power" then
            nqs.needwater = true
            generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
            table.insert(nqs.power_setup_info, { nqs.boilertype, generators })
            table.insert(nqs.power_setup_info, { "steam-engine", generators * 2 })
            if nqs.omnifluid then
                table.insert(nqs.power_setup_info, { "burner-omnitractor", math.floor(generators / 5 + 0.99) })
            else
                table.insert(nqs.power_setup_info, { "offshore-pump", math.floor(generators / 20 + 0.99) })
            end
            if settings.global["nqs-electric-inserters"].value then
                table.insert(nqs.power_setup_info, { "inserter", generators })
            else
                table.insert(nqs.power_setup_info, { "burner-inserter", generators })
            end
        elseif settings.global["nqs-power-type"].value == "Solar Power" then
            generators = math.floor(settings.global["nqs-desired-power-output"].value / 0.042 + 0.99)
            table.insert(nqs.power_setup_info, { "solar-panel", generators })
            if settings.global["nqs-provide-accumulators"].value then
                table.insert(nqs.power_setup_info, { "accumulator", math.floor(generators * 0.84 + 0.99) })
            end
        elseif settings.global["nqs-power-type"].value == "Thermal Solar Power" then
            nqs.needwater = true
            if nqs.thermalsolar then
                if nqs.AAII then
                    table.insert(nqs.power_setup_info, { "burner-turbine", 1 })
                    if settings.global["nqs-electric-inserters"].value then
                        table.insert(nqs.power_setup_info, { "inserter", 4 })
                    else
                        table.insert(nqs.power_setup_info, { "burner-inserter", 4 })
                    end
                end
                generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
                if nqs.omnifluid then
                    table.insert(nqs.power_setup_info, { "CW-basic-heat-exchanger-converter", generators })
                    table.insert(nqs.power_setup_info, { "burner-omnitractor", math.floor(generators / 5 + 0.99) })
                else
                    table.insert(nqs.power_setup_info, { "CW-basic-heat-exchanger", generators })
                    table.insert(nqs.power_setup_info, { "offshore-pump", math.floor(generators / 20 + 0.99) })
                end
                table.insert(nqs.power_setup_info, { "steam-engine", generators * 2 })
                table.insert(nqs.power_setup_info, { "CW-thermal-solar-panel", generators * 18 })
                if settings.global["nqs-provide-steam-battery"].value then
                    table.insert(nqs.power_setup_info, { "storage-tank", generators })
                end
                if settings.global["nqs-provide-heat-accumulators"].value then
                    table.insert(nqs.power_setup_info, { "CW-molten-salt-Heat-Accumulator", generators })
                end
            else
                generators = math.floor(settings.global["nqs-desired-power-output"].value / 0.042 + 0.99)
                table.insert(nqs.power_setup_info, { "solar-panel", generators })
                if settings.global["nqs-provide-accumulators"].value then
                    table.insert(nqs.power_setup_info, { "accumulator", math.floor(generators * 0.84 + 0.99) })
                end
            end
        end
        if nqs.needwater then nqs.numberofwater = math.floor(nqs.desiredpoweroutput / 18 + 0.99) end
    end
end)
