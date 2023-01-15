table.insert(nqs.setupFuncs, function()
    if game.active_mods["pycoalprocessing"] then
        nqs.pyCoal = true
        nqs.plantationnumber = settings.global["nqs-number-of-plantations"].value
        nqs.distilatornumber = settings.global["nqs-number-of-distilators"].value > 0
        nqs.pondsnumber = settings.global["nqs-number-of-ponds"].value > 0
    end
end)
