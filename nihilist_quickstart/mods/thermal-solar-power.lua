table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["thermal-solar-power"] then
      nqs.thermalsolar = true
    end
  end
)
