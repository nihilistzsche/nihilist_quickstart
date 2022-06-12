table.insert(
	NQS_SetupFuncs,
	function()
		local insertertype, inserternumber
		-- Check settings for inserters
		if settings.global["nqs-inserter-type"].value == "Burner only" then
			insertertype = "burner-inserter"
			inserternumber = settings.global["nqs-number-of-inserters"].value
		elseif settings.global["nqs-inserter-type"].value == "Electric only" then
			insertertype = "inserter"
			inserternumber = settings.global["nqs-number-of-inserters"].value
		else
			inserternumber = 0
		end
		NQS_State.insertertype = insertertype
		NQS_State.inserternumber = inserternumber

		local belttype, undergroundtype, splittertype
		-- Check settings for belts
		if NQS_State.bobbasicbelts and settings.global["nqs-bob-belts"].value then
			belttype = "basic-transport-belt"
			undergroundtype = "basic-underground-belt"
			splittertype = "basic-splitter"
		else
			belttype = "transport-belt"
			undergroundtype = "underground-belt"
			splittertype = "splitter"
		end
		NQS_State.belttype = belttype
		NQS_State.undergroundtype = undergroundtype
		NQS_State.splittertype = splittertype

		NQS_State.beltnumber = settings.global["nqs-number-of-belts"].value
		NQS_State.undergroundnumber = settings.global["nqs-number-of-undergrounds"].value
		NQS_State.splitternumber = settings.global["nqs-number-of-splitters"].value

		-- Check settings for loaders
		local loadernumber, loadertype = 0, nil
		if NQS_State.loaders then
			if settings.global["nqs-loader-type"].value == "Deadlock's Loaders" then
				loadernumber = settings.global["nqs-number-of-loaders"].value
				if bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
					loadertype = "basic-transport-belt-loader"
				else
					loadertype = "transport-belt-loader"
				end
			elseif settings.global["nqs-loader-type"].value == "Vanilla Loaders HD" then
				loadernumber = settings.global["nqs-number-of-loaders"].value
				if bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
					loadertype = "basic-loader"
				else
					loadertype = "loader"
				end
			elseif settings.global["nqs-loader-type"].value == "Miniloaders" then
				loadernumber = settings.global["nqs-number-of-loaders"].value
				if bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
					loadertype = "miniloader"
				else
					loadertype = "loader"
				end
			elseif settings.global["nqs-loader-type"].value == "None" then
				loadernumber = 0
			end
			NQS_State.loadertype = loadertype
			NQS_State.loadernumber = loadernumber
		end
		local beltboxnumber, beltboxtype
		if NQS_State.deadlockbeltboxes then
			if settings.global["nqs-number-of-beltboxes"].value > 0 then
				beltboxnumber = settings.global["nqs-number-of-beltboxes"].value
				if NQS_State.bobbasicbelts and settings.global["nqs-use-basic-loaders"].value then
					beltboxtype = "basic-transport-belt-beltbox"
				else
					beltboxtype = "transport-belt-beltbox"
				end
			end
			NQS_State.beltboxtype = beltboxtype
			NQS_State.beltboxnumber = beltboxnumber
		end
		local pipetype, pipeundergroundtype
		-- Check settings for pipes
		if NQS_State.Boblogistics and settings.global["nqs-bob-pipes"].value then
			pipetype = "stone-pipe"
			pipeundergroundtype = "stone-pipe-to-ground"
		else
			pipetype = "pipe"
			pipeundergroundtype = "pipe-to-ground"
		end
		NQS_State.pipetype = pipetype
		NQS_State.pipeundergroundtype = pipeundergroundtype
		NQS_State.pipenumber = settings.global["nqs-number-of-pipes"].value
		NQS_State.pipeundergroundnumber = settings.global["nqs-number-of-pipe-undergrounds"].value

		-- Check settings for mining drills
		local minernumber
		local minernumber2 = 0
		local minertype, minertype2
		if settings.global["nqs-miner-type"].value == "Burner mining drills" then
			minertype = "burner-mining-drill"
			minernumber = settings.global["nqs-number-of-miners"].value
		elseif settings.global["nqs-miner-type"].value == "Electric mining drills" then
			minertype = "electric-mining-drill"
			minernumber = settings.global["nqs-number-of-miners"].value
		elseif settings.global["nqs-miner-type"].value == "Mining Drones" then
			minertype = "mining-depot"
			minernumber = settings.global["nqs-number-of-mining-depots"].value
			minertype2 = "mining-drone"
			minernumber2 = settings.global["nqs-number-of-mining-drones"].value
			NQS_State.miningdrones = true
		else
			minernumber = 0
		end
		NQS_State.minernumber = minernumber
		NQS_State.minernumber2 = minernumber2
		NQS_State.minertype = minertype
		NQS_State.minertype2 = minertype2

		-- Check settings for labs and assemblers
		-- Settings default balues
		NQS_State.labtype = "lab"
		NQS_State.labnumber = settings.global["nqs-number-of-labs"].value
		NQS_State.assemblertype = "assembling-machine-1"
		NQS_State.assemblernumber = settings.global["nqs-number-of-assemblers"].value

		if settings.global["nqs-labs-assemblers"].value == "AAII Burner" then
			NQS_State.labtype = "burner-lab"
			NQS_State.labnumber = settings.global["nqs-number-of-labs"].value
			NQS_State.assemblertype = "burner-assembling-machine"
			NQS_State.assemblernumber = settings.global["nqs-number-of-assemblers"].value
		elseif settings.global["nqs-labs-assemblers"].value == "Amator Phasma's Burner" then
			NQS_State.labtype = "apm_lab_0"
			NQS_State.labnumber = settings.global["nqs-number-of-labs"].value
			NQS_State.assemblertype = "apm_assembling_machine_0"
			NQS_State.assemblernumber = settings.global["nqs-number-of-assemblers"].value
		elseif settings.global["nqs-labs-assemblers"].value == "Electric" then
			NQS_State.labtype = "lab"
			NQS_State.labnumber = settings.global["nqs-number-of-labs"].value
			NQS_State.assemblertype = "assembling-machine-1"
			NQS_State.assemblernumber = settings.global["nqs-number-of-assemblers"].value
		elseif settings.global["nqs-labs-assemblers"].value == "None" then
			NQS_State.labtype = "lab"
			NQS_State.labnumber = 0
			NQS_State.assemblertype = "assembling-machine-1"
			NQS_State.assemblernumber = 0
		end

		-- Checking settings for power poles
		NQS_State.poletype = "small-electric-pole"
		NQS_State.polenumber = settings.global["nqs-number-of-poles"].value

		if AAII and settings.global["nqs-aai-power-poles"] then
			NQS_State.poletype = "small-iron-electric-pole"
		end

		-- Check settings for furnaces
		NQS_State.furnacenumber = settings.global["nqs-number-of-furnaces"].value

		local furnacetype
		if minimachines and settings.global["nqs-mini-furnaces"].value then
			furnacetype = "mini-furnace-1"
		elseif electricfurnaces and settings.global["nqs-electric-furnaces"].value then
			furnacetype = "electric-stone-furnace"
		else
			furnacetype = "stone-furnace"
		end
		NQS_State.furnacetype = furnacetype

		local boilertype
		if NQS_State.electricboiler and settings.global["nqs-provide-electric-boilers"].value then
			if NQS_State.omnifluid then
				boilertype = "electric-boiler-converter"
			else
				boilertype = "electric-boiler"
			end
		else
			if NQS_State.omnifluid then
				boilertype = "boiler-converter"
			else
				boilertype = "boiler"
			end
		end
		NQS_State.boilertype = boilertype
		local gunturretammotype = "firearm-magazine"
		local gunturretammonumber
		if settings.global["nqs-number-of-gun-turrets"].value > 0 then
			NQS_State.gunturretnumber = settings.global["nqs-number-of-gun-turrets"].value
			if settings.global["nqs-type-of-gun-turret-ammo"].value == "Piercing rounds" then
				gunturretammotype = "piercing-rounds-magazine"
			end
			if settings.global["nqs-number-of-gun-turret-ammo"].value > 0 then
				gunturretammonumber =
					settings.global["nqs-number-of-gun-turrets"].value * settings.global["nqs-number-of-gun-turret-ammo"].value
			end
		end
		NQS_State.gunturretammotype = gunturretammotype
		NQS_State.gunturretammonumber = gunturretammonumber
		NQS_State.stonewallnumber = settings.global["nqs-number-of-stone-walls"].value
		NQS_State.gatenumber = settings.global["nqs-number-of-gates"].value

		-- luacheck: push no max comment line length
		-- Checking settings for power structures
		-- Check for settings "AAII Burner Turbines", "AAII Steam Power", "Steam Power", "Thermal Solar Power", "Solar Panels", "None"
		-- luacheck: pop
		local desiredpoweroutput = settings.global["nqs-desired-power-output"].value
		NQS_State.power_setup_info = {}
		local generators
		if desiredpoweroutput > 0 then
			NQS_State.desiredpoweroutput = desiredpoweroutput
			if settings.global["nqs-power-type"].value == "AAII Burner Turbines" then
				if NQS_State.AAII then
					generators = math.floor(settings.global["nqs-desired-power-output"].value / 2 + 0.99)
					table.insert(NQS_State.power_setup_info, {"burner-turbine", generators})
					if settings.global["nqs-electric-inserters"].value then
						table.insert(NQS_State.power_setup_info, {"inserter", math.floor(generators * 4)})
					else
						table.insert(NQS_State.power_setup_info, {"burner-inserter", math.floor(generators * 4)})
					end
				else
					generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
					table.insert(NQS_State.power_setup_info, {boilertype, generators})
					table.insert(NQS_State.power_setup_info, {"steam-engine", generators * 2})
					table.insert(NQS_State.power_setup_info, {"offshore-pump", math.floor(generators / 20 + 0.99)})
					if settings.global["nqs-electric-inserters"].value then
						table.insert(NQS_State.power_setup_info, {"inserter", generators})
					else
						table.insert(NQS_State.power_setup_info, {"burner-inserter", generators})
					end
				end
			elseif settings.global["nqs-power-type"].value == "AAII Steam Power" then
				NQS_State.needwater = true
				if NQS_State.AAII then
					table.insert(NQS_State.power_setup_info, {"burner-turbine", 1})
					generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
					table.insert(NQS_State.power_setup_info, {boilertype, generators})
					table.insert(NQS_State.power_setup_info, {"steam-engine", generators * 2})
					table.insert(NQS_State.power_setup_info, {"offshore-pump", math.floor(generators / 20 + 0.99)})
					if settings.global["nqs-electric-inserters"].value then
						table.insert(NQS_State.power_setup_info, {"inserter", generators + 4})
					else
						table.insert(NQS_State.power_setup_info, {"burner-inserter", generators + 4})
					end
				else
					generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
					table.insert(NQS_State.power_setup_info, {boilertype, generators})
					table.insert(NQS_State.power_setup_info, {"steam-engine", generators * 2})
					table.insert(NQS_State.power_setup_info, {"offshore-pump", math.floor(generators / 20 + 0.99)})
					if settings.global["nqs-electric-inserters"].value then
						table.insert(NQS_State.power_setup_info, {"inserter", generators})
					else
						table.insert(NQS_State.power_setup_info, {"burner-inserter", generators})
					end
				end
			elseif settings.global["nqs-power-type"].value == "Steam Power" then
				NQS_State.needwater = true
				generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
				table.insert(NQS_State.power_setup_info, {boilertype, generators})
				table.insert(NQS_State.power_setup_info, {"steam-engine", generators * 2})
				if omnifluid then
					table.insert(NQS_State.power_setup_info, {"burner-omnitractor", math.floor(generators / 5 + 0.99)})
				else
					table.insert(NQS_State.power_setup_info, {"offshore-pump", math.floor(generators / 20 + 0.99)})
				end
				if settings.global["nqs-electric-inserters"].value then
					table.insert(NQS_State.power_setup_info, {"inserter", generators})
				else
					table.insert(NQS_State.power_setup_info, {"burner-inserter", generators})
				end
			elseif settings.global["nqs-power-type"].value == "Solar Power" then
				generators = math.floor(settings.global["nqs-desired-power-output"].value / 0.042 + 0.99)
				table.insert(NQS_State.power_setup_info, {"solar-panel", generators})
				if settings.global["nqs-provide-accumulators"].value then
					table.insert(NQS_State.power_setup_info, {"accumulator", math.floor(generators * 0.84 + 0.99)})
				end
			elseif settings.global["nqs-power-type"].value == "Thermal Solar Power" then
				NQS_State.needwater = true
				if NQS_State.thermalsolar then
					if NQS_State.AAII then
						table.insert(NQS_State.power_setup_info, {"burner-turbine", 1})
						if settings.global["nqs-electric-inserters"].value then
							table.insert(NQS_State.power_setup_info, {"inserter", 4})
						else
							table.insert(NQS_State.power_setup_info, {"burner-inserter", 4})
						end
					end
					generators = math.floor(settings.global["nqs-desired-power-output"].value / 1.8 + 0.99)
					if NQS_State.omnifluid then
						table.insert(NQS_State.power_setup_info, {"CW-basic-heat-exchanger-converter", generators})
						table.insert(NQS_State.power_setup_info, {"burner-omnitractor", math.floor(generators / 5 + 0.99)})
					else
						table.insert(NQS_State.power_setup_info, {"CW-basic-heat-exchanger", generators})
						table.insert(NQS_State.power_setup_info, {"offshore-pump", math.floor(generators / 20 + 0.99)})
					end
					table.insert(NQS_State.power_setup_info, {"steam-engine", generators * 2})
					table.insert(NQS_State.power_setup_info, {"CW-thermal-solar-panel", generators * 18})
					if settings.global["nqs-provide-steam-battery"].value then
						table.insert(NQS_State.power_setup_info, {"storage-tank", generators})
					end
					if settings.global["nqs-provide-heat-accumulators"].value then
						table.insert(NQS_State.power_setup_info, {"CW-molten-salt-Heat-Accumulator", generators})
					end
				else
					generators = math.floor(settings.global["nqs-desired-power-output"].value / 0.042 + 0.99)
					table.insert(NQS_State.power_setup_info, {"solar-panel", generators})
					if settings.global["nqs-provide-accumulators"].value then
						table.insert(NQS_State.power_setup_info, {"accumulator", math.floor(generators * 0.84 + 0.99)})
					end
				end
			end
			if NQS_State.needwater then
				NQS_State.numberofwater = math.floor(NQS_State.desiredpoweroutput / 18 + 0.99)
			end
		end
		NQS_State.chestnumber = settings.global["nqs-number-of-chests"].value
		local fuel_map = {
			["Wood"] = "wood",
			["Coal"] = "coal",
			["Solid Fuel"] = "solid-fuel",
			["Purified Omnite"] = "purified-omnite",
			["Processed Fuel"] = "processed-fuel"
		}
		NQS_State.fueltype = fuel_map[settings.global["nqs-fuel-type"].value]
		NQS_State.fuelnumber = settings.global["nqs-number-of-fuel"].value

		NQS_State.cliffexplosivenumber = settings.global["nqs-number-of-cliff-explosives"].value
	end
)
