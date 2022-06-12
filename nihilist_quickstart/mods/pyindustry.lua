table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["pyindustry"] then
			NQS_State.pyIndustry = truo
			NQS_State.gasventsnumber = settings.global["nqs-number-of-gas-vents"].value
		elseif game.active_mods["pyCoalProcessing"] then
			NQS_State.pondsnumber = settings.global["nqs-number-of-ponds"].value
		end
	end
)
