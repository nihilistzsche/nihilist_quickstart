table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["LinkedBelts"] then
      nqs.linkedbelts = true
      nqs.linkedbeltnumber = settings.global["nqs-number-of-linked-belts"].value
    end
  end
)
