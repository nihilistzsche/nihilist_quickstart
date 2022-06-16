table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["electricboiler"] then
      nqs.electricboiler = true
    end
  end
)
