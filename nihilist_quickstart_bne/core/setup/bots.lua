table.insert(nqs_bne.setupFuncs, function()
    local conbots, logbots
    -- Checking settings for robots
    if settings.global["nqs-robots-mod"].value == "Bob's mk2" then
        conbots = "bob-construction-robot-2"
        logbots = "bob-logistic-robot-2"
    elseif settings.global["nqs-robots-mod"].value == "Bob's mk3" then
        conbots = "bob-construction-robot-3"
        logbots = "bob-logistic-robot-3"
    elseif settings.global["nqs-robots-mod"].value == "Bob's mk4" then
        conbots = "bob-construction-robot-4"
        logbots = "bob-logistic-robot-4"
    elseif settings.global["nqs-robots-mod"].value == "Bob's fusion mk4" then
        conbots = "bob-construction-robot-5"
        logbots = "bob-logistic-robot-5"
    elseif settings.global["nqs-robots-mod"].value == "Pyanodons industry" then
        conbots = "py-construction-robot-01"
        logbots = "py-logistic-robot-01"
    elseif settings.global["nqs-robots-mod"].value == "Pyanodons hightech" then
        conbots = "construction-robot-ht"
        logbots = "logistic-robot-ht"
    elseif settings.global["nqs-robots-mod"].value == "Yuoki industries" then
        conbots = "yi_construction-robot"
        logbots = "yi_logistic-robot"
    elseif settings.global["nqs-robots-mod"].value:sub(1, 5) == "5dim " then
        local num = settings.global["nqs-robots-mod"].value:sub(-2)
        conbots = "5d-construction-robot-" .. num
        logbots = "5d-logistic-robot-" .. num
    else
        conbots = "construction-robot"
        logbots = "logistic-robot"
    end
    nqs_bne.conbots = conbots
    nqs_bne.logbots = logbots

    local roboporttype
    -- Bobslogistics: roboport mk2 mk3 mk4, pyindustry: pyRoboport Yuoki: YiRoboport
    if settings.global["nqs-type-of-roboports"].value == "Vanilla" then
        roboporttype = "roboport"
    elseif settings.global["nqs-type-of-roboports"].value == "Bob's mk2" then
        roboporttype = "bob-roboport-2"
    elseif settings.global["nqs-type-of-roboports"].value == "Bob's mk3" then
        roboporttype = "bob-roboport-3"
    elseif settings.global["nqs-type-of-roboports"].value == "Bob's mk4" then
        roboporttype = "bob-roboport-4"
    elseif settings.global["nqs-type-of-roboports"].value == "Pyanodons industry" then
        roboporttype = "py-roboport-mk01"
    elseif settings.global["nqs-type-of-roboports"].value == "Yuoki industries" then
        roboporttype = "yi_roboport"
    elseif settings.global["nqs-type-of-roboports"].value:sub(1, 5) == "5dim " then
        local num = settings.global["nqs-type-of-roboports"].value:sub(-2)
        roboporttype = "5d-roboport-" .. num
    elseif settings.global["nqs-type-of-roboports"].value == "None" then
    end
    nqs_bne.roboporttype = roboporttype
    local roboportsnumber = settings.global["nqs-number-of-roboports"].value
    local logbotsnumber = settings.global["nqs-number-of-logistic-robots"].value
    local conbotsnumber = settings.global["nqs-number-of-construction-robots"].value
    local requesternumber = settings.global["nqs-number-of-requester-chests"].value
    local providernumber = settings.global["nqs-number-of-provider-chests"].value
    local storagenumber = settings.global["nqs-number-of-storage-chests"].value

    nqs_bne.roboportsnumber = roboportsnumber
    nqs_bne.logbotsnumber = logbotsnumber
    nqs_bne.conbotsnumber = conbotsnumber
    nqs_bne.requesternumber = requesternumber
    nqs_bne.providernumber = providernumber
    nqs_bne.storagenumber = storagenumber

    local giverobots, givechests
    if roboportsnumber > 0 then
        if settings.global["nqs-robots-mod"].value == "None" then
            giverobots = false
        else
            giverobots = true
        end
        givechests = true
    else
        giverobots = settings.global["nqs-provide-robots-alone"].value
        givechests = settings.global["nqs-provide-chests-alone"].value
    end

    nqs_bne.giverobots = giverobots
    nqs_bne.givechests = givechests
end)
