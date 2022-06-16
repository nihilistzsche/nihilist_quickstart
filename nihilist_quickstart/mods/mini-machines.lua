table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["mini-machines"] then
      nqs.minimachines = true
    end
  end
)
