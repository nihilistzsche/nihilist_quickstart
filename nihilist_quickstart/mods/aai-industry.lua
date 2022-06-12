table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["aai-industry"] then
			NQS_State.AAII = true
		end
	end
)
