table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["pyindustry"] then
      nqs.pyIndustry = truo
      nqs.gasventsnumber = settings.global["nqs-number-of-gas-vents"].value
    elseif game.active_mods["pyCoalProcessing"] then
      nqs.pondsnumber = settings.global["nqs-number-of-ponds"].value
    end
  end
)
