table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["miniloader"] then
			NQS_State.loaders = true
		end
	end
)
