table.insert(nqs_bne.setupFuncs, function()
    nqs_bne.custom_insertion_info = {}
    for word in string.gmatch(settings.global["nqs-custom-entities"].value, "%S+") do
        local customnamebase, customnumberbase = string.match(word, "(.+):(%d+)")
        local customname = tostring(customnamebase)
        local customnumber = tonumber(customnumberbase)
        if prototypes.item[customname] and type(customnumber) == "number" and customnumber > 0 then
            table.insert(nqs_bne.custom_insertion_info, { name = customname, count = customnumber })
        else
            game.print(
                "Error when loading custom entities. Check settings for spelling error and restart to receive requested items."
            )
            game.print(customname)
        end
    end
end)
