table.insert(nqs.setupFuncs, function()
    if script.active_mods["pyindustry"] then
        nqs.pyIndustry = true
        nqs.gasventsnumber = settings.global["nqs-number-of-gas-vents"].value
    elseif script.active_mods["pyCoalProcessing"] then
        nqs.pondsnumber = settings.global["nqs-number-of-ponds"].value
    end
end)
