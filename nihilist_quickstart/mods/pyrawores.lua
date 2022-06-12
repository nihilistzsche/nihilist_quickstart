table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["pyrawores"] then
			NQS_State.pyOres = true
			NQS_State.crystalminernumber = settings.global["nqs-number-of-crystal-mines"].value
		end
	end
)
