table.insert(nqs.setupFuncs, function()
    if game.active_mods["angelssmelting"] then
        nqs.Angelssmelting = true
        nqs.ifurnacenumber = settings.global["nqs-number-of-induction-furnaces"].value
        nqs.bfurnacenumber = settings.global["nqs-number-of-blast-furnaces"].value
        nqs.cmachinenumber = settings.global["nqs-number-of-casting-machines"].value
    end
end)
