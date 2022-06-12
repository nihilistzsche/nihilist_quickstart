table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["boblogistics"] then
			NQS_State.Boblogistics = true
			if settings.startup["bobmods-logistics-beltoverhaul"].value then
				NQS_State.bobbasicbelts = true
			else
				NQS_State.bobbasicbelts = false
			end
		end
	end
)
