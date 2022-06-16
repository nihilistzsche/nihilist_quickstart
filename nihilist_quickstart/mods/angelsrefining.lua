table.insert(
  nqs.setupFuncs,
  function()
    if game.active_mods["angelsrefining"] then
      nqs.Angelsrefining = true
      if (settings.global["nqs-number-of-crushers"].value > 0 or settings.global["nqs-number-of-sorters"].value > 0) then
        if settings.global["nqs-type-of-crushers"].value then
          nqs.crushertype = "ore-crusher"
        else
          nqs.crushertype = "burner-ore-crusher"
        end
        nqs.crushernumber = settings.global["nqs-number-of-crushers"].value
        if settings.global["nqs-number-of-sorters"].value > 0 then
          nqs.sorternumber = settings.global["nqs-number-of-sorters"].value
        end
      end
    end
  end
)
