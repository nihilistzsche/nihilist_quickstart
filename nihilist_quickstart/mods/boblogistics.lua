table.insert(nqs.setupFuncs, function()
    if game.active_mods["boblogistics"] then
        nqs.Boblogistics = true
        if settings.startup["bobmods-logistics-beltoverhaul"].value then
            nqs.bobbasicbelts = true
        else
            nqs.bobbasicbelts = false
        end
    end
end)
