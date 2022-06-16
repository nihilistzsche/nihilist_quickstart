table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["omnimatter_fluid"] then
      nqs.omnifluid = true
    end
  end
)
