table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["omnimatter"] then
			NQS_State.Omnimatter = true
			NQS_State.omnitractornumber = settings.global["nqs-number-of-omnitractors"].value
			if settings.global["nqs-provide-electric-omnitractors"].value then
				NQS_State.omnitractortype = "omnitractor-1"
			else
				NQS_State.omnitractortype = "burner-omnitractor"
			end
		end
	end
)
