table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["thermal-solar-power"] then
			NQS_State.thermalsolar = true
		end
	end
)
