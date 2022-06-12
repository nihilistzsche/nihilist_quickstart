table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["electricboiler"] then
			NQS_State.electricboiler = true
		end
	end
)
