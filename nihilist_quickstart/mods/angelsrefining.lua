table.insert(
	NQS_SetupFuncs,
	function()
		if game.active_mods["angelsrefining"] then
			NQS_State.Angelsrefining = true
			if (settings.global["nqs-number-of-crushers"].value > 0 or settings.global["nqs-number-of-sorters"].value > 0) then
				if settings.global["nqs-type-of-crushers"].value then
					NQS_State.crushertype = "ore-crusher"
				else
					NQS_State.crushertype = "burner-ore-crusher"
				end
				NQS_State.crushernumber = settings.global["nqs-number-of-crushers"].value
				if settings.global["nqs-number-of-sorters"].value > 0 then
					NQS_State.sorternumber = settings.global["nqs-number-of-sorters"].value
				end
			end
		end
	end
)
