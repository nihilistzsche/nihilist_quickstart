table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["Oxygen_Patched"] then
			NQS_State.oxygenmod = true
			NQS_State.oxygenbottlesnumber = settings.global["nqs-number-of-oxygen-bottles"].value
			NQS_State.oxygenbottlestype = "oxygen-bottle"
		end
	end
)
