table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["miniloader"] then
      nqs.loaders = true
    end
  end
)
