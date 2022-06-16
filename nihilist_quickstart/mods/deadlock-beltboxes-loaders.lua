table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["deadlock-beltboxes-loaders"] then
      nqs.loaders = true
    end
  end
)
