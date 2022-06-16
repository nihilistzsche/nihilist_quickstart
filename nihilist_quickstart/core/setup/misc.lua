-- luacheck globals: nqs settings
table.insert(
  nqs.setupFuncs,
  function()
    local fuel_map = {
      ["Wood"] = "wood",
      ["Coal"] = "coal",
      ["Solid Fuel"] = "solid-fuel",
      ["Purified Omnite"] = "purified-omnite",
      ["Processed Fuel"] = "processed-fuel"
    }
    nqs.fueltype = fuel_map[settings.global["nqs-fuel-type"].value]
    nqs.fuelnumber = settings.global["nqs-number-of-fuel"].value

    nqs.cliffexplosivenumber = settings.global["nqs-number-of-cliff-explosives"].value
  end
)
