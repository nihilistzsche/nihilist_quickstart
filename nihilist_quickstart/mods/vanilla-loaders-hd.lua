table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["vanilla-loaders-hd"] then
			NQS_State.loaders = true
		end
	end
)
