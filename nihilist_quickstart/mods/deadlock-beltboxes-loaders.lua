table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["deadlock-beltboxes-loaders"] then
			NQS_State.loaders = true
		end
	end
)
