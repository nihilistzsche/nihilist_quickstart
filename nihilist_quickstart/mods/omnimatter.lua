table.insert(nqs.setupFuncs, function()
    if game.active_mods["omnimatter"] then
        nqs.Omnimatter = true
        nqs.omnitractornumber = settings.global["nqs-number-of-omnitractors"].value
        if settings.global["nqs-provide-electric-omnitractors"].value then
            nqs.omnitractortype = "omnitractor-1"
        else
            nqs.omnitractortype = "burner-omnitractor"
        end
    end
end)
