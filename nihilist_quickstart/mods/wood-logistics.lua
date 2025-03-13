table.insert(nqs.setupFuncs, function()
    if script.active_mods["wood-logistics"] and settings.startup["wood-logistics-belts"].value then
        nqs.woodLogistics = true
    end
end)
