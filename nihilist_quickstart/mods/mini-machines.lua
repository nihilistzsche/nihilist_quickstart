table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["mini-machines"] then
			NQS_State.minimachines = true
		end
	end
)
