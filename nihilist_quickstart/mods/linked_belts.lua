table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["LinkedBelts"] then
			NQS_State.linkedbelts = true
			NQS_State.linkedbeltnumber = settings.global["nqs-number-of-linked-belts"].value
		end
	end
)
