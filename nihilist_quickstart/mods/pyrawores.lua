table.insert(nqs.setupFuncs, function()
    if game.active_mods["pyrawores"] then
        nqs.pyOres = true
        nqs.crystalminernumber = settings.global["nqs-number-of-crystal-mines"].value
    end
end)
