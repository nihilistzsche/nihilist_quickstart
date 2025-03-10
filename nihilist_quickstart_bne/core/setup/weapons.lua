table.insert(nqs_bne.setupFuncs, function()
    if settings.global["nqs-equipment-gun-provide"].value then
        local guntype

        -- Guns
        if settings.global["nqs-equipment-gun"].value == "Pistol" then
            guntype = "pistol"
        elseif settings.global["nqs-equipment-gun"].value == "Submachine gun" then
            guntype = "submachine-gun"
        elseif settings.global["nqs-equipment-gun"].value == "Shotgun" then
            guntype = "shotgun"
        elseif settings.global["nqs-equipment-gun"].value == "Combat shotgun" then
            guntype = "combat-shotgun"
        elseif settings.global["nqs-equipment-gun"].value == "Rocket launcher" then
            guntype = "rocket-launcher"
        elseif settings.global["nqs-equipment-gun"].value == "Flamethrower" then
            guntype = "flamethrower"
        end
        nqs_bne.guntype = guntype

        local ammotype
        local ammonumber = settings.global["nqs-number-of-ammo"].value
        -- Ammo
        if settings.global["nqs-equipment-ammo"].value == "Firearm magazine" then
            ammotype = "firearm-magazine"
        elseif settings.global["nqs-equipment-ammo"].value == "Piercing rounds" then
            ammotype = "piercing-rounds-magazine"
        elseif settings.global["nqs-equipment-ammo"].value == "Uranium rounds" then
            ammotype = "uranium-rounds-magazine"
        elseif settings.global["nqs-equipment-ammo"].value == "Shotgun shells" then
            ammotype = "shotgun-shell"
        elseif settings.global["nqs-equipment-ammo"].value == "Piercing shotgun shells" then
            ammotype = "piercing-shotgun-shell"
        elseif settings.global["nqs-equipment-ammo"].value == "Rocket" then
            ammotype = "rocket"
        elseif settings.global["nqs-equipment-ammo"].value == "Explosive rocket" then
            ammotype = "explosive-rocket"
        elseif settings.global["nqs-equipment-ammo"].value == "Atomic bomb" then
            ammotype = "atomic-bomb"
        elseif settings.global["nqs-equipment-ammo"].value == "Flamethrower ammo" then
            ammotype = "flamethrower-ammo"
        end
        nqs_bne.ammotype = ammotype
        nqs_bne.ammonumber = ammonumber
    end
end)
