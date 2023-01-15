table.insert(nqs.setupFuncs, function()
    local insertertype, inserternumber
    -- Check settings for inserters
    if settings.global["nqs-inserter-type"].value == "Burner only" then
        insertertype = "burner-inserter"
        inserternumber = settings.global["nqs-number-of-inserters"].value
    elseif settings.global["nqs-inserter-type"].value == "Electric only" then
        insertertype = "inserter"
        inserternumber = settings.global["nqs-number-of-inserters"].value
    else
        inserternumber = 0
    end
    nqs.insertertype = insertertype
    nqs.inserternumber = inserternumber

    local belttype, undergroundtype, splittertype
    -- Check settings for belts
    if nqs.bobbasicbelts and settings.global["nqs-bob-belts"].value then
        belttype = "basic-transport-belt"
        undergroundtype = "basic-underground-belt"
        splittertype = "basic-splitter"
    else
        belttype = "transport-belt"
        undergroundtype = "underground-belt"
        splittertype = "splitter"
    end
    nqs.belttype = belttype
    nqs.undergroundtype = undergroundtype
    nqs.splittertype = splittertype

    nqs.beltnumber = settings.global["nqs-number-of-belts"].value
    nqs.undergroundnumber = settings.global["nqs-number-of-undergrounds"].value
    nqs.splitternumber = settings.global["nqs-number-of-splitters"].value

    -- Check settings for loaders
    local loadernumber, loadertype = 0, nil
    if nqs.loaders then
        if settings.global["nqs-loader-type"].value == "Deadlock's Loaders" then
            loadernumber = settings.global["nqs-number-of-loaders"].value
            if bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
                loadertype = "basic-transport-belt-loader"
            else
                loadertype = "transport-belt-loader"
            end
        elseif settings.global["nqs-loader-type"].value == "Vanilla Loaders HD" then
            loadernumber = settings.global["nqs-number-of-loaders"].value
            if bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
                loadertype = "basic-loader"
            else
                loadertype = "loader"
            end
        elseif settings.global["nqs-loader-type"].value == "Miniloaders" then
            loadernumber = settings.global["nqs-number-of-loaders"].value
            if bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
                loadertype = "miniloader"
            else
                loadertype = "loader"
            end
        elseif settings.global["nqs-loader-type"].value == "None" then
            loadernumber = 0
        end
        nqs.loadertype = loadertype
        nqs.loadernumber = loadernumber
    end
    local beltboxnumber, beltboxtype
    if nqs.deadlockbeltboxes then
        if settings.global["nqs-number-of-beltboxes"].value > 0 then
            beltboxnumber = settings.global["nqs-number-of-beltboxes"].value
            if nqs.bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
                beltboxtype = "basic-transport-belt-beltbox"
            else
                beltboxtype = "transport-belt-beltbox"
            end
        end
        nqs.beltboxtype = beltboxtype
        nqs.beltboxnumber = beltboxnumber
    end
    local pipetype, pipeundergroundtype
    -- Check settings for pipes
    if nqs.Boblogistics and settings.global["nqs-bob-pipes"].value then
        pipetype = "stone-pipe"
        pipeundergroundtype = "stone-pipe-to-ground"
    else
        pipetype = "pipe"
        pipeundergroundtype = "pipe-to-ground"
    end
    nqs.pipetype = pipetype
    nqs.pipeundergroundtype = pipeundergroundtype
    nqs.pipenumber = settings.global["nqs-number-of-pipes"].value
    nqs.pipeundergroundnumber = settings.global["nqs-number-of-pipe-undergrounds"].value

    nqs.chestnumber = settings.global["nqs-number-of-chests"].value
end)
