table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["Electric Furnaces"] then
			NQS_State.electricfurnaces = true
		end
	end
)
