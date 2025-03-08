table.insert(nqs.setupFuncs, function()
    if script.active_mods["Oxygen_Patched"] then
        nqs.oxygenmod = true
        nqs.oxygenbottlesnumber = settings.global["nqs-number-of-oxygen-bottles"].value
        nqs.oxygenbottlestype = "oxygen-bottle"
    end
end)
