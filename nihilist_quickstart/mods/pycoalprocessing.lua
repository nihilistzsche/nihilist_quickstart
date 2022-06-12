table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["pycoalprocessing"] then
			NQS_State.pyCoal = true
			NQS_State.plantationnumber = settings.global["nqs-number-of-plantations"].value
			NQS_State.distilatornumber = settings.global["nqs-number-of-distilators"].value > 0
			NQS_State.pondsnumber = settings.global["nqs-number-of-ponds"].value > 0
		end
	end
)
