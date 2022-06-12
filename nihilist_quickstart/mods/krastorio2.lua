table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["Krastorio2"] then
			NQS_State.krastorio2 = true
			NQS_State.crushertype = "kr-crusher"
			NQS_State.crushernumber = settings.global["nqs-number-of-crushers"].value
		end
	end
)
