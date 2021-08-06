-- luacheck: globals NQS_BNE_Init script defines game settings

local function quickstart_bne(e)
	if NQS_BNE_Init and NQS_BNE_Init[e.player_index] then
		return
	end
	local player = game.players[e.player_index]
	-- Variables
	local oxygenmod = game.active_mods["Oxygen_Patched"] ~= nil

	-- Insert in inventory function
	local function inventory(pname, pamount)
		player.insert{name = pname, count = pamount}
	end

	-- Checking list for custom entities
	--	if not settings.global["uqs-custom-entities"].value == "" then
	for word in string.gmatch(settings.global["uqs-custom-entities"].value, "%S+") do
		local customnamebase, customnumberbase = string.match(word, "(.+):(%d+)")
		local customname = tostring(customnamebase)
		local customnumber = tonumber(customnumberbase)
		if game.item_prototypes[customname] and type(customnumber) == "number" and customnumber > 0 then
			inventory(customname, customnumber)
		else
			game.print(
				"Error when loading custom entities. Check settings for spelling error and restart to receive requested items."
			)
			game.print(customname)
		end
	end
	--	end

	local conbots, logbots
	-- Checking settings for robots
	if settings.global["uqs-robots-mod"].value == "Bob's mk2" then
		conbots = "bob-construction-robot-2"
		logbots = "bob-logistic-robot-2"
	elseif settings.global["uqs-robots-mod"].value == "Bob's mk3" then
		conbots = "bob-construction-robot-3"
		logbots = "bob-logistic-robot-3"
	elseif settings.global["uqs-robots-mod"].value == "Bob's mk4" then
		conbots = "bob-construction-robot-4"
		logbots = "bob-logistic-robot-4"
	elseif settings.global["uqs-robots-mod"].value == "Bob's fusion mk4" then
		conbots = "bob-construction-robot-5"
		logbots = "bob-logistic-robot-5"
	elseif settings.global["uqs-robots-mod"].value == "Pyanodons industry" then
		conbots = "py-construction-robot-01"
		logbots = "py-logistic-robot-01"
	elseif settings.global["uqs-robots-mod"].value == "Pyanodons hightech" then
		conbots = "construction-robot-ht"
		logbots = "logistic-robot-ht"
	elseif settings.global["uqs-robots-mod"].value == "Yuoki industries" then
		conbots = "yi_construction-robot"
		logbots = "yi_logistic-robot"
	else
		conbots = "construction-robot"
		logbots = "logistic-robot"
	end

	local armortype, noarmor
	-- Checking for armor type
	if settings.global["uqs-armor"].value == "Modular Armor" then
		armortype = 1
	elseif settings.global["uqs-armor"].value == "Power Armor" then
		armortype = 2
	elseif settings.global["uqs-armor"].value == "Power Armor MK2" then
		armortype = 3
	elseif settings.global["uqs-armor"].value == "Power Armor MK3" then
		armortype = 4
	elseif settings.global["uqs-armor"].value == "Power Armor MK4" then
		armortype = 5
	elseif settings.global["uqs-armor"].value == "Power Armor MK5" then
		armortype = 6
	elseif settings.global["uqs-armor"].value == "Standard YI Suite" then
		armortype = 7
	elseif settings.global["uqs-armor"].value == "Master Technic Suite" then
		armortype = 8
	elseif settings.global["uqs-armor"].value == "Master YI Suite" then
		armortype = 9
	elseif settings.global["uqs-armor"].value == "Walker - T.R." then
		armortype = 10
	elseif settings.global["uqs-armor"].value == "I Am the Walking Death" then
		armortype = 11
	elseif settings.global["uqs-armor"].value == "None" then
		noarmor = true
	end

	-- Armor generation
	local function getarmor()
		-- Define variables
		local robotmult = 0
		local powertype = 1
		local batterytype = 1
		local personalroboporttype = 1
		local energyshieldtype = 1
		local beltimmunityplaced = false
		local nightvisionplaced = false
		local inbackpack = false

		-- Define vectors for grid size
		local gridmt = {}

		-- Checking whether to put equipment in inventory or grid
		if settings.global["uqs-equipment-in-backpack"].value then
			inbackpack = true
		end

		local powersourcetype, fuelcells
		-- Checking power source
		if settings.global["uqs-equipment-power"].value == "Solar panels" then
			powertype = "solar-panel-equipment"
			powersourcetype = 1
		elseif settings.global["uqs-equipment-power"].value == "Solar panels MK2" then
			powertype = "solar-panel-equipment-2"
			powersourcetype = 1
		elseif settings.global["uqs-equipment-power"].value == "Solar panels MK3" then
			powertype = "solar-panel-equipment-3"
			powersourcetype = 1
		elseif settings.global["uqs-equipment-power"].value == "Solar panels MK4" then
			powertype = "solar-panel-equipment-4"
			powersourcetype = 1
		elseif settings.global["uqs-equipment-power"].value == "Fusion reactors" then
			powertype = "fusion-reactor-equipment"
			powersourcetype = 2
		elseif settings.global["uqs-equipment-power"].value == "Fusion reactors MK2" then
			powertype = "fusion-reactor-equipment-2"
			powersourcetype = 2
		elseif settings.global["uqs-equipment-power"].value == "Fusion reactors MK3" then
			powertype = "fusion-reactor-equipment-3"
			powersourcetype = 2
		elseif settings.global["uqs-equipment-power"].value == "Fusion reactors MK4" then
			powertype = "fusion-reactor-equipment-4"
			powersourcetype = 2
		elseif settings.global["uqs-equipment-power"].value == "Portable generators" then
			powertype = "portable-generator-equipment"
			powersourcetype = 3
		elseif settings.global["uqs-equipment-power"].value == "Portable reactors" then
			powertype = "portable-reactor-equipment"
			powersourcetype = 4
			fuelcells = settings.global["uqs-number-of-uranium-fuel"].value
		elseif settings.global["uqs-equipment-power"].value == "Personal Tesseract" then
			powertype = "personal-tesseract-1"
			powersourcetype = 1
		elseif settings.global["uqs-equipment-power"].value == "Personal Tesseract Mk2" then
			powertype = "personal-tesseract-2"
			powersourcetype = 1
		elseif settings.global["uqs-equipment-power"].value == "Personal Tesseract Mk3" then
			powertype = "personal-tesseract-3"
			powersourcetype = 1
		elseif settings.global["uqs-equipment-power"].value == "Personal Tesseract Mk4" then
			powertype = "personal-tesseract-4"
			powersourcetype = 1
		end
		local powersources = settings.global["uqs-number-of-panels-reactors"].value

		-- Checking settings for battery
		local batteries = settings.global["uqs-number-of-batteries"].value
		if settings.global["uqs-equipment-battery"].value == "Battery" then
			batterytype = "battery-equipment"
		elseif settings.global["uqs-equipment-battery"].value == "Battery MK2" then
			batterytype = "battery-mk2-equipment"
		elseif settings.global["uqs-equipment-battery"].value == "Battery MK3" then
			batterytype = "battery-mk3-equipment"
		elseif settings.global["uqs-equipment-battery"].value == "Battery MK4" then
			batterytype = "battery-mk4-equipment"
		elseif settings.global["uqs-equipment-battery"].value == "Battery MK5" then
			batterytype = "battery-mk5-equipment"
		elseif settings.global["uqs-equipment-battery"].value == "Battery MK6" then
			batterytype = "battery-mk6-equipment"
		elseif settings.global["uqs-equipment-battery"].value == "None" then
			batteries = 0
		end

		-- Checking settings for roboport
		local roboports = settings.global["uqs-number-of-personal-roboports"].value
		if settings.global["uqs-equipment-personal-roboport"].value == "Roboport" then
			personalroboporttype = 1
			robotmult = 10
		elseif settings.global["uqs-equipment-personal-roboport"].value == "Roboport MK2" then
			personalroboporttype = 2
			if game.active_mods["bobequipment"] then
				robotmult = 15
			else
				robotmult = 25
			end
		elseif settings.global["uqs-equipment-personal-roboport"].value == "None" then
			roboports = 0
		end

		-- Checking settings for exoskeletons
		local exoskeletons = settings.global["uqs-number-of-exoskeletons"].value
		local exoskeletontype
		if settings.global["uqs-equipment-exoskeletons"].value == "Exoskeleton" then
			exoskeletontype = "exoskeleton-equipment"
		elseif settings.global["uqs-equipment-exoskeletons"].value == "Exoskeleton MK2" then
			exoskeletontype = "exoskeleton-equipment-2"
		elseif settings.global["uqs-equipment-exoskeletons"].value == "Exoskeleton MK3" then
			exoskeletontype = "exoskeleton-equipment-3"
		elseif settings.global["uqs-equipment-exoskeletons"].value == "None" then
			exoskeletons = 0
		end

		-- Checking settings for energy shield
		local energyshields = settings.global["uqs-number-of-energy-shields"].value
		if settings.global["uqs-equipment-energy-shield"].value == "Energy Shield" then
			energyshieldtype = "energy-shield-equipment"
		elseif settings.global["uqs-equipment-energy-shield"].value == "Energy Shield MK2" then
			energyshieldtype = "energy-shield-mk2-equipment"
		elseif settings.global["uqs-equipment-energy-shield"].value == "Energy Shield MK3" then
			energyshieldtype = "energy-shield-mk3-equipment"
		elseif settings.global["uqs-equipment-energy-shield"].value == "Energy Shield MK4" then
			energyshieldtype = "energy-shield-mk4-equipment"
		elseif settings.global["uqs-equipment-energy-shield"].value == "Energy Shield MK5" then
			energyshieldtype = "energy-shield-mk5-equipment"
		elseif settings.global["uqs-equipment-energy-shield"].value == "Energy Shield MK6" then
			energyshieldtype = "energy-shield-mk6-equipment"
		elseif settings.global["uqs-equipment-energy-shield"].value == "None" then
			energyshields = 0
		end

		local dischargedefense
		-- Checking settings for discharge defense
		if settings.global["uqs-equipment-discharge-defense"].value then
			dischargedefense = 1
		else
			dischargedefense = 0
		end

		-- Checking settings for personal laser defense
		local personallaserdefenses = settings.global["uqs-number-of-personal-laser-defense"].value

		-- Give armor
		if not noarmor then
			if inbackpack then
				-- Insert in backpack
				-- Powersources in backpack
				if powersources > 0 then
					inventory(powertype, powersources)
				end

				-- Batteries in backpack
				if batteries > 0 then
					inventory(batterytype, batteries)
				end

				-- Oxygen gas mask in backpack
				if oxygenmod and settings.global["uqs-oxygen-gas-mask"].value then
					inventory("gas-mask", 1)
				end

				-- Night vision in backpack
				if settings.global["uqs-equipment-night-vision"].value then
					inventory("night-vision-equipment", 1)
				end

				-- Roboports in backpack
				if personalroboporttype == 1 and roboports > 0 then
					inventory("personal-roboport-equipment", roboports)
					inventory(conbots, roboports * 10)
				elseif personalroboporttype == 2 and roboports > 0 then
					inventory("personal-roboport-mk2-equipment", roboports)
					if game.active_mods["bobequipment"] then
						inventory(conbots, roboports * 15)
					else
						inventory(conbots, roboports * 25)
					end
				end

				-- Exoskeletons in backpack
				if exoskeletons > 0 then
					inventory(exoskeletontype, exoskeletons)
				end

				-- Energy shields in backpack
				if energyshields > 0 then
					inventory(energyshieldtype, energyshields)
				end

				-- Discharge defense in backpack
				if settings.global["uqs-equipment-discharge-defense"].value then
					inventory("discharge-defense-equipment", 1)
				end

				-- Personal laser defense in backpack
				if personallaserdefenses > 0 then
					inventory("personal-laser-defense-equipment", personallaserdefenses)
				end

				-- Belt immunity in backpack
				if settings.global["uqs-equipment-belt-immunity"].value then
					inventory("belt-immunity-equipment", 1)
				end
			else
				local function findArmorGrid()
					local function isInventoryValid(inv)
						return inv and inv.valid and not inv.is_empty()
					end
					local function isArmorValid(item)
						return item and item.valid and item.valid_for_read and item.is_armor and item.grid
					end

					local firstInv = player.get_inventory(5)
					if isInventoryValid(firstInv) then
						for k = #firstInv, 1, -1 do
							local v = firstInv[k]
							if isArmorValid(v) then
								return v.grid
							end
						end
					end

					local secondInv = player.get_main_inventory()
					if isInventoryValid(secondInv) then
						for k = #secondInv, 1, -1 do
							local v = secondInv[k]
							if isArmorValid(v) then
								return v.grid
							end
						end
					end
				end
				local grid = findArmorGrid()
				-- Insert in grid function
				local function gridput(eqname, gridcol, gridrow)
					grid.put({name = eqname, position = {gridcol,gridrow}})
				end

				local gridwidth = grid.width
				local gridheight = grid.height
				-- Reserve original amount of roboports
				local roboportsoriginal = roboports
				-- Create gridmatrix
				for x = 0, (gridheight - 1) do
					gridmt[x] = {}
					for y = 0, (gridwidth - 1) do
						gridmt[x][y] = 0
					end
				end
				local w,h

				local oxygengasmaskplaced = false

				-- Adding equipment to grid
				for j = 0, (gridwidth - 1) do
					for i = 0, (gridheight - 1) do
						-- Solar Panels and Fusion Reactors
						if powersources > 0 and gridmt[j][i] == 0 then
							if powersourcetype == 1 then
								gridput(powertype, j, i)
								powersources = powersources - 1
								gridmt[j][i] = 1
							elseif powersourcetype == 2 then
								w = j + 3
								h = i + 3
								if gridwidth > w and gridheight > h then
									gridput(powertype, j, i)
									powersources = powersources - 1
									for k = j, w do
										for l = i, h do
											gridmt[k][l] = 1
										end
									end
								end
							elseif powersourcetype == 3 then
								w = j + 1
								h = i + 2
								if gridwidth > w and gridheight > h then
									gridput(powertype, j, i)
									powersources = powersources - 1
									for k = j, w do
										for l = i, h do
											gridmt[k][l] = 1
										end
									end
								end
							elseif powersourcetype == 4 then
								w = j + 3
								h = i + 3
								if gridwidth > w and gridheight > h then
									gridput(powertype, j, i)
									powersources = powersources - 1
									if fuelcells > 0 then
										inventory("uranium-fuel-cell", fuelcells)
									end
									for k = j, w do
										for l = i, h do
											gridmt[k][l] = 1
										end
									end
								end
							end
						end

						-- Batteries
						if batteries > 0 and gridmt[j][i] == 0 then
							w = j
							h = i + 1
							if gridheight > h then
								gridput(batterytype, j, i)
								batteries = batteries - 1
								for k = j, w do
									for l = i, h do
										gridmt[k][l] = 1
									end
								end
							end
						end
						-- Oxygen Gas Mask
						if oxygenmod and settings.global["uqs-oxygen-gas-mask"].value and not oxygengasmaskplaced and gridmt[j][i] == 0 then
							w = j + 1
							h = i + 1
							if gridwidth > w and gridheight > h then
								gridput("gas-mask", j, i)
								oxygengasmaskplaced = true
								for k = j, w do
									for l = i, h do
										gridmt[k][l] = 1
									end
								end
							end
						end

						-- Night Vision
						if settings.global["uqs-equipment-night-vision"].value and not nightvisionplaced and gridmt[j][i] == 0 then
							w = j + 1
							h = i + 1
							if gridwidth > w and gridheight > h then
								gridput("night-vision-equipment", j, i)
								nightvisionplaced = true
								for k = j, w do
									for l = i, h do
										gridmt[k][l] = 1
									end
								end
							end
						end

						-- Personal roboports
						if roboports > 0 and gridmt[j][i] == 0 then
							if personalroboporttype == 1 then
								w = j + 1
								h = i + 1
								if gridwidth > w and gridheight > h then
									gridput("personal-roboport-equipment", j, i)
									roboports = roboports - 1
									for k = j, w do
										for l = i, h do
											gridmt[k][l] = 1
										end
									end
								end
							elseif personalroboporttype == 2 then
								w = j + 1
								h = i + 1
								if gridwidth > w and gridheight > h then
									gridput("personal-roboport-mk2-equipment", j, i)
									roboports = roboports - 1
									for k = j, w do
										for l = i, h do
											gridmt[k][l] = 1
										end
									end
								end
							end
						end

						-- Exoskeletons
						if exoskeletons > 0 and gridmt[j][i] == 0 then
							w = j + 1
							h = i + 3
							if gridwidth > w and gridheight > h then
								gridput(exoskeletontype, j, i)
								exoskeletons = exoskeletons - 1
								for k = j, w do
									for l = i, h do
										gridmt[k][l] = 1
									end
								end
							end
						end

						-- Personal energyshields
						if energyshields > 0 and gridmt[j][i] == 0 then
							w = j + 1
							h = i + 1
							if gridwidth > w and gridheight > h then
								gridput(energyshieldtype, j, i)
								energyshields = energyshields - 1
								for k = j, w do
									for l = i, h do
										gridmt[k][l] = 1
									end
								end
							end
						end

						-- Discharge Defense
						if dischargedefense > 0 and gridmt[j][i] == 0 then
							w = j + 1
							h = i + 1
							if gridwidth > w and gridheight > h then
								gridput("discharge-defense-equipment", j, i)
								dischargedefense = dischargedefense - 1
								for k = j, w do
									for l = i, h do
										gridmt[k][l] = 1
									end
								end
							end
						end

						-- Personal Laser Defense
						if personallaserdefenses > 0 and gridmt[j][i] == 0 then
							w = j + 1
							h = i + 1
							if gridwidth > w and gridheight > h then
								gridput("personal-laser-defense-equipment", j, i)
								personallaserdefenses = personallaserdefenses - 1
								for k = j, w do
									for l = i, h do
										gridmt[k][l] = 1
									end
								end
							end
						end

						-- Belt Immunity Equipment
						if settings.global["uqs-equipment-belt-immunity"].value and not beltimmunityplaced and gridmt[j][i] == 0 then
							gridput("belt-immunity-equipment", j, i)
							beltimmunityplaced = true
							gridmt[j][i] = 1
						end
					end
				end
				for j = 0, (gridwidth - 1) do
					for i = 0, (gridheight - 1) do
						-- Fill empty with solar panels
						if settings.global["uqs-equipment-solar-fill"].value and grid.get({j, i}) == nil then
							gridput(powersourcetype == 1 and powertype or "solar-panel-equipment", j, i)
						end
					end
				end
				local roboportsinserted = roboportsoriginal - roboports
				if settings.global["uqs-supply-robots"].value and roboportsinserted > 0 then
					player.insert {name = conbots, count = roboportsinserted * robotmult}
				end
			end
		end
	end

	-- Give robots and stuff to player
	local function getstuff()
		local roboportsnumber = settings.global["uqs-number-of-roboports"].value
		local logbotsnumber = settings.global["uqs-number-of-logistic-robots"].value
		local conbotsnumber = settings.global["uqs-number-of-construction-robots"].value
		local requesternumber = settings.global["uqs-number-of-requester-chests"].value
		local providernumber = settings.global["uqs-number-of-provider-chests"].value
		local storagenumber = settings.global["uqs-number-of-storage-chests"].value

		local roboporttype
		-- Bobslogistics: roboport mk2 mk3 mk4, pyindustry: pyRoboport Yuoki: YiRoboport
		if settings.global["uqs-type-of-roboports"].value == "Vanilla" then
			roboporttype = 1
		elseif settings.global["uqs-type-of-roboports"].value == "Bob's mk2" then
			roboporttype = 2
		elseif settings.global["uqs-type-of-roboports"].value == "Bob's mk3" then
			roboporttype = 3
		elseif settings.global["uqs-type-of-roboports"].value == "Bob's mk4" then
			roboporttype = 4
		elseif settings.global["uqs-type-of-roboports"].value == "Pyanodons industry" then
			roboporttype = 5
		elseif settings.global["uqs-type-of-roboports"].value == "Yuoki industries" then
			roboporttype = 6
		elseif settings.global["uqs-type-of-roboports"].value == "None" then
			roboporttype = 0
		end

		local giveroboports, giverobots, givechests
		if roboporttype > 0 and roboportsnumber > 0 then
			giveroboports = true
			if settings.global["uqs-robots-mod"].value == "None" then
				giverobots = false
			else
				giverobots = true
			end
			givechests = true
		else
			giveroboports = false
			giverobots = settings.global["uqs-provide-robots-alone"].value
			givechests = settings.global["uqs-provide-chests-alone"].value
		end

		-- Roboports, chests and robots
		if giveroboports then
			if roboporttype == 1 then
				inventory("roboport", roboportsnumber)
			end
			if roboporttype == 2 then
				inventory("bob-roboport-2", roboportsnumber)
			end
			if roboporttype == 3 then
				inventory("bob-roboport-3", roboportsnumber)
			end
			if roboporttype == 4 then
				inventory("bob-roboport-4", roboportsnumber)
			end
			if roboporttype == 5 then
				inventory("py-roboport-mk01", roboportsnumber)
			end
			if roboporttype == 6 then
				inventory("yi_roboport", roboportsnumber)
			end
		end
		if giverobots then
			if logbotsnumber > 0 then
				inventory(logbots, logbotsnumber)
			end
			if conbotsnumber > 0 then
				inventory(conbots, conbotsnumber)
			end
		end
		if givechests then
			if requesternumber > 0 then
				inventory("logistic-chest-requester", requesternumber)
			end
			if providernumber > 0 then
				if settings.global["uqs-provide-active-providers"].value then
					inventory("logistic-chest-active-provider", math.floor(providernumber / 2))
					inventory("logistic-chest-passive-provider", math.floor(providernumber / 2))
				else
					inventory("logistic-chest-passive-provider", providernumber)
				end
			end
			if storagenumber > 0 then
				if settings.global["uqs-provide-buffers"].value then
					inventory("logistic-chest-buffer", math.floor(storagenumber / 2))
					inventory("logistic-chest-storage", math.floor(storagenumber / 2))
				else
					inventory("logistic-chest-storage", storagenumber)
				end
			end
		end
	end

	local function getguns()
		-- Guns and ammo
		if settings.global["uqs-equipment-gun-provide"].value then
			-- Guns
			if settings.global["uqs-equipment-gun"].value == "Pistol" then
				inventory("pistol", 1)
			elseif settings.global["uqs-equipment-gun"].value == "Submachine gun" then
				inventory("submachine-gun", 1)
			elseif settings.global["uqs-equipment-gun"].value == "Shotgun" then
				inventory("shotgun", 1)
			elseif settings.global["uqs-equipment-gun"].value == "Combat shotgun" then
				inventory("combat-shotgun", 1)
			elseif settings.global["uqs-equipment-gun"].value == "Rocket launcher" then
				inventory("rocket-launcher", 1)
			elseif settings.global["uqs-equipment-gun"].value == "Flamethrower" then
				inventory("flamethrower", 1)
			end
			local ammonumber = settings.global["uqs-number-of-ammo"].value
			-- Ammo
			if settings.global["uqs-equipment-ammo"].value == "Firearm magazine" then
				inventory("firearm-magazine", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Piercing rounds" then
				inventory("piercing-rounds-magazine", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Uranium rounds" then
				inventory("uranium-rounds-magazine", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Shotgun shells" then
				inventory("shotgun-shell", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Piercing shotgun shells" then
				inventory("piercing-shotgun-shell", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Rocket" then
				inventory("rocket", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Explosive rocket" then
				inventory("explosive-rocket", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Atomic bomb" then
				inventory("atomic-bomb", ammonumber)
			elseif settings.global["uqs-equipment-ammo"].value == "Flamethrower ammo" then
				inventory("flamethrower-ammo", ammonumber)
			end
		end
	end
	-- Give armor and equipment
	local armorname = {
		"modular-armor",
		"power-armor",
		"power-armor-mk2",
		"bob-power-armor-mk3",
		"bob-power-armor-mk4",
		"bob-power-armor-mk5",
		"yi_armor_gray",
		"yi_armor_red",
		"yi_armor_gold",
		"yi_walker_a",
		"yi_walker_c"
	}
	if not noarmor then
		player.insert{name = armorname[armortype], count = 1}
	end

	getarmor()
	getguns()

	getstuff()

	NQS_BNE_Init = NQS_BNE_Init or {}
	NQS_BNE_Init[e.player_index] = true
end

script.on_event(defines.events.on_player_created, quickstart_bne)
script.on_event(defines.events.on_cutscene_cancelled, quickstart_bne)
