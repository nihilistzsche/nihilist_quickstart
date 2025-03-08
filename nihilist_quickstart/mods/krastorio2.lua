table.insert(nqs.setupFuncs, function()
    if script.active_mods["Krastorio2"] then
        nqs.krastorio2 = true
        nqs.crushertype = "kr-crusher"
        nqs.crushernumber = settings.global["nqs-number-of-crushers"].value
    end
end)
