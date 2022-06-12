table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["angelssmelting"] then
			NQS_State.Angelssmelting = true
			NQS_State.ifurnacenumber = settings.global["nqs-number-of-induction-furnaces"].value
			NQS_State.bfurnacenumber = settings.global["nqs-number-of-blast-furnaces"].value
			NQS_State.cmachinenumber = settings.global["nqs-number-of-casting-machines"].value
		end
	end
)
