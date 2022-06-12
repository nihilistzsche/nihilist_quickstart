table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["market2"] then
			NQS_State.marketmod = true
			NQS_State.marketchestsnumber = settings.global["nqs-number-of-market-chests"].value
			NQS_State.marketcheststype = "marketitem-selling-chest"
			NQS_State.markettanksnumber = settings.global["nqs-number-of-market-tanks"].value
			NQS_State.markettankstype = "marketitem-selling-tank"
			NQS_State.marketaccumulatorsnumber = settings.global["nqs-number-of-market-accumulators"].value
			NQS_State.marketaccumulatorstype = "marketitem-accumulator"
		end
	end
)
