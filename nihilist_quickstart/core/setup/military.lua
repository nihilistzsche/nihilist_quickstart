table.insert(
  nqs.setupFuncs,
  function()
    local gunturretammotype = "firearm-magazine"
    local gunturretammonumber
    nqs.gunturretnumber = settings.global["nqs-number-of-gun-turrets"].value
    if settings.global["nqs-type-of-gun-turret-ammo"].value == "Piercing rounds" then
      gunturretammotype = "piercing-rounds-magazine"
    end
    gunturretammonumber =
      settings.global["nqs-number-of-gun-turrets"].value * settings.global["nqs-number-of-gun-turret-ammo"].value

    nqs.gunturretammotype = gunturretammotype
    nqs.gunturretammonumber = gunturretammonumber
    nqs.stonewallnumber = settings.global["nqs-number-of-stone-walls"].value
    nqs.gatenumber = settings.global["nqs-number-of-gates"].value
  end
)
