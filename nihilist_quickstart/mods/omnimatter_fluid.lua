table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["omnimatter_fluid"] then
			NQS_State.omnifluid = true
		end
	end
)
