table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["market2"] then
      nqs.marketmod = true
      nqs.marketchestsnumber = settings.global["nqs-number-of-market-chests"].value
      nqs.marketcheststype = "marketitem-selling-chest"
      nqs.markettanksnumber = settings.global["nqs-number-of-market-tanks"].value
      nqs.markettankstype = "marketitem-selling-tank"
      nqs.marketaccumulatorsnumber = settings.global["nqs-number-of-market-accumulators"].value
      nqs.marketaccumulatorstype = "marketitem-accumulator"
    end
  end
)
