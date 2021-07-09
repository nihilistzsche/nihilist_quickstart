script.on_init(function()
    local created_items = remote.call("freeplay", "get_created_items")
-- Variables
	AAII = false
	Angelsrefining = false
	Omnimatter = false
	Boblogistics = false
	pyCoal = false
	pyOres = false
	pyIndustry = false
	deadlockloaders = false
	thermalsolar = false
	amatorcoal = false
	generators = 0
	needwater = false
	logisticbelts = false
	logisticrobots = false
	yuoki = false
	uqsbne = false
	vanillaloadershd = false
	miningdrones = false
	miniloaders = false
	marketmod = false
	oxygenmod = false
    electricboiler = false

-- Check for active game.active_mods
		if game.active_mods["aai-industry"] then
			AAII = true
		end
		if game.active_mods["angelsrefining"] then
			Angelsrefining = true
		end
		if game.active_mods["omnimatter"] then
			Omnimatter = true
		end
		if game.active_mods["boblogistics"] then
			Boblogistics = true
		end
		if game.active_mods["pycoalprocessing"] then
			pyCoal = true
		end
		if game.active_mods["pyrawores"] then
			pyOres = true
		end
		if game.active_mods["pyindustry"] then
			pyIndustry = true
		end
		if game.active_mods["deadlock-integrations"] then
			deadlockloaders = true
		end
		if game.active_mods["CW-thermal-solar-power"] then
			thermalsolar = true
		end
		if game.active_mods["apm_power"] then
			amatorcoal = true
		end
		if game.active_mods["Yuoki"] then
			yuoki = true
		end
		if game.active_mods["universal_quickstart_bne"] then
			uqsbne = true
		end
		if game.active_mods["vanilla-loaders-hd"] then
			vanillaloadershd = true
		end
		if game.active_mods["Electric Furnaces"] then
			electricfurnaces = true
		end
		if game.active_mods["miniloader"] then
			miniloaders = true
		end
		if game.active_mods["market2"] then
			marketmod = true
		end
		if game.active_mods["Oxygen2_0"] then
			oxygenmod = true
		end
        if game.active_mods["electricboiler"] then
            electricboiler = true
        end
-- Check for clearing main inventory
	--[[if settings.global["uqs-clear-inventory"].value then
		if player.character then
			player.get_inventory(defines.inventory.character_main).clear()
		else
			player.get_inventory(defines.inventory.god_main).clear()
		end
	end]]

-- Check for boblogistics and beltoverhaul
	if Boblogistics and settings.startup["bobmods-logistics-beltoverhaul"].value then
		bobbasicbelts = true
	else
		bobbasicbelts = false
	end

-- Check settings for inserters
	if settings.global["uqs-inserter-type"].value == "Burner only" then
		insertertype = "burner-inserter"
		inserternumber = settings.global["uqs-number-of-inserters"].value
	elseif settings.global["uqs-inserter-type"].value == "Electric only" then
		insertertype = "inserter"
		inserternumber = settings.global["uqs-number-of-inserters"].value
	else
		inserternumber = 0
	end

-- Check settings for belts
	if bobbasicbelts and settings.global["uqs-bob-belts"].value then
		belttype = "basic-transport-belt"
		undergroundtype = "basic-underground-belt"
		splittertype = "basic-splitter"
	else
		belttype = "transport-belt"
		undergroundtype = "underground-belt"
		splittertype = "splitter"
	end
	beltnumber = settings.global["uqs-number-of-belts"].value
	undergroundnumber = settings.global["uqs-number-of-undergrounds"].value
	splitternumber = settings.global["uqs-number-of-splitters"].value

-- Check settings for loaders
	loadernumber = 0
	if miniloaders or vanillaloadershd or deadlockloaders then
		if settings.global["uqs-loader-type"].value == "Deadlock's Loaders" then
			loadernumber = settings.global["uqs-number-of-loaders"].value
			if bobbasicbelts and settings.global["uqs-use-basic-loaders"].value then
				loadertype = "basic-transport-belt-loader"
			else
				loadertype = "transport-belt-loader"
			end
		elseif settings.global["uqs-loader-type"].value == "Vanilla Loaders HD" then
			loadernumber = settings.global["uqs-number-of-loaders"].value
			if bobbasicbelts and settings.global["uqs-use-basic-loaders"].value then
				loadertype = "basic-loader"
			else
				loadertype = "loader"
			end
		elseif settings.global["uqs-loader-type"].value == "Miniloaders" then
			loadernumber = settings.global["uqs-number-of-loaders"].value
			if bobbasicbelts and settings.global["uqs-use-basic-loaders"].value  then
				loadertype = "miniloader"
			else
				loadertype = "loader"
			end
		elseif settings.global["uqs-loader-type"].value == "None" then
			loadernumber = 0
		end
	end


-- Check settings for pipes
	if Boblogistics and settings.global["uqs-bob-pipes"].value then
		pipetype = "stone-pipe"
		pipeundergroundtype = "stone-pipe-to-ground"
	else
		pipetype = "pipe"
		pipeundergroundtype = "pipe-to-ground"
	end
	pipenumber = settings.global["uqs-number-of-pipes"].value
	pipeundergroundnumber = settings.global["uqs-number-of-pipe-undergrounds"].value

-- Check settings for mining drills
	minernumber = 0
	minernumber2 = 0
	if settings.global["uqs-miner-type"].value == "Burner mining drills" then
		minertype = "burner-mining-drill"
		minernumber = settings.global["uqs-number-of-miners"].value
	elseif settings.global["uqs-miner-type"].value == "Electric mining drills" then
		minertype = "electric-mining-drill"
		minernumber = settings.global["uqs-number-of-miners"].value
	elseif settings.global["uqs-miner-type"].value == "Mining Drones" then
		minertype = "mining-depot"
		minernumber = settings.global["uqs-number-of-mining-depots"].value
		minertype2 = "mining-drone"
		minernumber2 = settings.global["uqs-number-of-mining-drones"].value
		miningdrones = true
	else
		minernumber = 0
	end

-- Check settings for labs and assemblers
-- Settings default balues
	labtype = "lab"
	labnumber = settings.global["uqs-number-of-labs"].value
	assemblertype = "assembling-machine-1"
	assemblernumber = settings.global["uqs-number-of-assemblers"].value

	if settings.global["uqs-labs-assemblers"].value == "AAII Burner" then
		labtype = "burner-lab"
		labnumber = settings.global["uqs-number-of-labs"].value
		assemblertype = "burner-assembling-machine"
		assemblernumber = settings.global["uqs-number-of-assemblers"].value
	elseif settings.global["uqs-labs-assemblers"].value == "Amator Phasma's Burner" then
		labtype = "apm_lab_0"
		labnumber = settings.global["uqs-number-of-labs"].value
		assemblertype = "apm_assembling_machine_0"
		assemblernumber = settings.global["uqs-number-of-assemblers"].value
	elseif settings.global["uqs-labs-assemblers"].value == "Electric" then
		labtype = "lab"
		labnumber = settings.global["uqs-number-of-labs"].value
		assemblertype = "assembling-machine-1"
		assemblernumber = settings.global["uqs-number-of-assemblers"].value
	elseif settings.global["uqs-labs-assemblers"].value == "None" then
		labtype = "lab"
		labnumber = 0
		assemblertype = "assembling-machine-1"
		assemblernumber = 0
	end

-- Checking settings for power poles
	poletype = "small-electric-pole"
	polenumber = settings.global["uqs-number-of-poles"].value
	
	if AAII and settings.global["uqs-aai-power-poles"] then
		poletype = "small-iron-electric-pole"
	end

-- Check settings for omnitractors
	if Omnimatter then
		omnitractornumber = settings.global["uqs-number-of-omnitractors"].value
        if settings.global["uqs-provide-electric-omnitractors"].value then
            omnitractortype = "omnitractor-1"
        else
		    omnitractortype = "burner-omnitractor"
        end
	end

-- Check settings for furnaces
	furnacenumber = settings.global["uqs-number-of-furnaces"].value

	if electricfurnaces and settings.global["uqs-electric-furnaces"].value then
		furnacetype = "electric-stone-furnace"
	else
		furnacetype = "stone-furnace"
	end

-- Check settings for marketmod
	if marketmod then
		marketchestsnumber = settings.global["uqs-number-of-market-chests"].value
		marketcheststype = "marketitem-selling-chest"
		markettanksnumber = settings.global["uqs-number-of-market-tanks"].value
		markettankstype = "marketitem-selling-tank"
		marketaccumulatorsnumber = settings.global["uqs-number-of-market-accumulators"].value
		marketaccumulatorstype = "marketitem-accumulator"
	end
	
-- Check settings for Oxygen 2.0
	if oxygenmod then
		oxygenbottlesnumber = settings.global["uqs-number-of-oxygen-bottles"].value
		oxygenbottlestype = "oxygen-bottle"
	end

    if electricboiler and settings.global["uqs-provide-electric-boilers"].value then
        boilertype = "electric-boiler"
    else
        boilertype = "boiler"
    end

-- Give belt and stuff to player
function getstuff(player)

-- Inserting inserters
	if inserternumber > 0 then
		inventory(insertertype, inserternumber)
	end

-- Inserting belts
	if beltnumber > 0 then
		inventory(belttype, beltnumber)
	end

-- Inserting undergrounds
	if undergroundnumber > 0 then
		inventory(undergroundtype, undergroundnumber)
	end

-- Inserting splitters
	if splitternumber > 0 then
		inventory(splittertype, splitternumber)
	end

-- Inserting loaders
	if loadernumber > 0 then
		inventory(loadertype, loadernumber)
	end

-- Inserting pipes
	if pipenumber > 0 then
		inventory(pipetype, pipenumber)
	end

-- Inserting pipe-to-grounds
	if pipeundergroundnumber > 0 then
		inventory(pipeundergroundtype, pipeundergroundnumber)
	end

-- Inserting mining drills
	if minernumber > 0 then
		inventory(minertype, minernumber)
	end

-- Inserting mining drones
	if minernumber2 > 0 and miningdrones then
		inventory(minertype2, minernumber2)
	end

-- Inserting labs
	if labnumber > 0 then
		inventory(labtype, labnumber)
	end

-- Inserting assembling machines
	if assemblernumber > 0 then
		inventory(assemblertype, assemblernumber)
	end

-- Inserting power poles
	if polenumber > 0 then
		inventory(poletype, polenumber)
	end

-- Inserting Omnitractors
	if Omnimatter and settings.global["uqs-number-of-omnitractors"].value > 0 then
		inventory(omnitractortype, omnitractornumber)
	end

-- Inserting furnaces
	if settings.global["uqs-number-of-furnaces"].value > 0 then
		inventory(furnacetype, furnacenumber)
	end

-- Inserting Market stuff
	if marketmod then
		if settings.global["uqs-number-of-market-chests"].value > 0 then
			inventory(marketcheststype, marketchestsnumber)
		end
		if settings.global["uqs-number-of-market-tanks"].value > 0 then
			inventory(markettankstype, markettanksnumber)
		end
		if settings.global["uqs-number-of-market-accumulators"].value > 0 then
			inventory(marketaccumulatorstype, marketaccumulatorsnumber)
		end
	end

-- Inserting oxygen stuff
	if oxygenmod then
		if settings.global["uqs-number-of-oxygen-bottles"].value > 0 then
			inventory(oxygenbottlestype, oxygenbottlesnumber)
		end
	end

-- Checking settings for power structures
-- Check for settings "AAII Burner Turbines", "AAII Steam Power", "Steam Power", "Thermal Solar Power", "Solar Panels", "None"
	if settings.global["uqs-desired-power-output"].value > 0 then
		if settings.global["uqs-power-type"].value == "AAII Burner Turbines" then
			if AAII then
				generators = math.floor(settings.global["uqs-desired-power-output"].value/2+0.99)
				inventory("burner-turbine",  generators)
				if settings.global["uqs-electric-inserters"].value then
					inventory("inserter",  math.floor(generators * 4))
				else
					inventory("burner-inserter",  math.floor(generators * 4))
				end
			else
				generators = math.floor(settings.global["uqs-desired-power-output"].value/1.8+0.99)
				inventory(boilertype,  generators)
				inventory("steam-engine",  generators * 2)
				inventory("offshore-pump",  math.floor(generators / 20 + 0.99))
				if settings.global["uqs-electric-inserters"].value then
					inventory("inserter",  generators)
				else
					inventory("burner-inserter",  generators)
				end
			end
		elseif settings.global["uqs-power-type"].value == "AAII Steam Power" then
			needwater = true
			if AAII then
				inventory("burner-turbine",  1)
				generators = math.floor(settings.global["uqs-desired-power-output"].value/1.8+0.99)
				inventory(boilertype,  generators)
				inventory("steam-engine",  generators * 2)
				inventory("offshore-pump",  math.floor(generators / 20 + 0.99))
				if settings.global["uqs-electric-inserters"].value then
					inventory("inserter",  generators + 4)
				else
					inventory("burner-inserter",  generators + 4)
				end
			else
				generators = math.floor(settings.global["uqs-desired-power-output"].value/1.8+0.99)
				inventory(boilertype,  generators)
				inventory("steam-engine",  generators * 2)
				inventory("offshore-pump",  math.floor(generators / 20 + 0.99))
				if settings.global["uqs-electric-inserters"].value then
					inventory("inserter",  generators)
				else
					inventory("burner-inserter",  generators)
				end
			end
		elseif settings.global["uqs-power-type"].value == "Steam Power" then
			needwater = true
			generators = math.floor(settings.global["uqs-desired-power-output"].value/1.8+0.99)
			inventory(boilertype,  generators)
			inventory("steam-engine",  generators * 2)
			inventory("offshore-pump",  math.floor(generators / 20 + 0.99))
			if settings.global["uqs-electric-inserters"].value then
				inventory("inserter",  generators)
			else
				inventory("burner-inserter",  generators)
			end
		elseif settings.global["uqs-power-type"].value == "Solar Power" then
			generators = math.floor(settings.global["uqs-desired-power-output"].value/0.042+0.99)
			inventory("solar-panel",  generators)
			if settings.global["uqs-provide-accumulators"].value then
				inventory("accumulator",  math.floor(generators * 0.84 + 0.99))
			end
		elseif settings.global["uqs-power-type"].value == "Thermal Solar Power" then
			needwater = true
			if thermalsolar then
				if AAII then
					inventory("burner-turbine",  1)
					if settings.global["uqs-electric-inserters"].value then
						inventory("inserter",  4)
					else
						inventory("burner-inserter",  4)
					end
				end
				generators = math.floor(settings.global["uqs-desired-power-output"].value/1.8+0.99)
				inventory("CW-basic-heat-exchanger",  generators)
				inventory("steam-engine",  generators * 2)
				inventory("CW-thermal-solar-panel",  generators * 18)
				inventory("offshore-pump",  math.floor(generators / 20 + 0.99))
				if settings.global["uqs-provide-steam-battery"].value then
					inventory("storage-tank",  generators)
				end
				if settings.global["uqs-provide-heat-accumulators"].value then
					inventory("CW-molten-salt-Heat-Accumulator",  generators)
				end
			else
				generators = math.floor(settings.global["uqs-desired-power-output"].value/0.042+0.99)
				inventory("solar-panel",  generators)
				if settings.global["uqs-provide-accumulators"].value then
					inventory("accumulator",  math.floor(generators * 0.84 + 0.99))
				end
			end
		end
	end

-- Water for power in omnimatter
	if Omnimatter and needwater then
		numberofwater = math.floor(settings.global["uqs-desired-power-output"].value/18+0.99)
		inventory("omniphlog-1", numberofwater)
		inventory("omnitractor-1", numberofwater)
	end

-- Checking settings for furnaces, crushers, omnitractors, chests
	if Angelsrefining and settings.global["uqs-number-of-crushers"].value > 0 then
		if settings.global["uqs-type-of-crushers"].value then
			inventory("ore-crusher", settings.global["uqs-number-of-crushers"].value)
		else
			inventory("burner-ore-crusher", settings.global["uqs-number-of-crushers"].value)
		end
	end
	if settings.global["uqs-number-of-chests"].value > 0 then
		inventory("wooden-chest", settings.global["uqs-number-of-chests"].value)
	end

-- Checking fuel settings
	if settings.global["uqs-number-of-fuel"].value > 0 then
		if settings.global["uqs-fuel-type"].value == "Wood" then
			inventory("wood", settings.global["uqs-number-of-fuel"].value)
		elseif settings.global["uqs-fuel-type"].value == "Coal" then
			inventory("coal", settings.global["uqs-number-of-fuel"].value)
		elseif settings.global["uqs-fuel-type"].value == "Solid Fuel" then
			inventory("solid-fuel", settings.global["uqs-number-of-fuel"].value)
		end
	end

-- Checking settings for cliff explosives
	if settings.global["uqs-number-of-cliff-explosives"].value > 0 then
		inventory("cliff-explosives", settings.global["uqs-number-of-cliff-explosives"].value)
	end

-- Checking for pycoalprocessing
	if pyCoal then
		if settings.global["uqs-number-of-plantations"].value > 0 then
			inventory("fawogae-plantation", settings.global["uqs-number-of-plantations"].value)
		end
		if settings.global["uqs-number-of-distilators"].value > 0 then
			inventory("distilator", settings.global["uqs-number-of-distilators"].value)
		end
		if settings.global["uqs-number-of-ponds"].value > 0 then
			inventory("tailings-pond", settings.global["uqs-number-of-ponds"].value)
		end
		if pyIndustry then
			if settings.global["uqs-number-of-gas-vents"].value > 0 then
				inventory("py-gas-vent", settings.global["uqs-number-of-gas-vents"].value)
			end
		else
			if settings.global["uqs-number-of-ponds"].value > 0 then
				inventory("tailings-pond", 1)
			end
		end
		inventory("offshore-pump", 1)
		if pyOres then
			if settings.global["uqs-number-of-crystal-mines"].value > 0 then
				inventory("borax-mine", settings.global["uqs-number-of-crystal-mines"].value)
			end
		end
	end

-- Checking settings for defensive structures
	gunturretammotype = "firearm-magazine"
	gunturretammonumer = 0
	if settings.global["uqs-number-of-gun-turrets"].value > 0 then
		inventory("gun-turret", settings.global["uqs-number-of-gun-turrets"].value)
		if settings.global["uqs-type-of-gun-turret-ammo"].value == "Piercing rounds" then
			gunturretammotype = "piercing-rounds-magazine"
		end
		if settings.global["uqs-number-of-gun-turret-ammo"].value > 0 then
			gunturretammonumber = settings.global["uqs-number-of-gun-turrets"].value * settings.global["uqs-number-of-gun-turret-ammo"].value
			inventory(gunturretammotype, gunturretammonumber)
		end
	end
	if settings.global["uqs-number-of-stone-walls"].value > 0 then
		inventory("stone-wall", settings.global["uqs-number-of-stone-walls"].value)
	end
	if settings.global["uqs-number-of-gates"].value > 0 then
		inventory("gate", settings.global["uqs-number-of-gates"].value)
	end
end





-- Armor generation
function getarmor(player)

-- Define vector containing armor prototype internal names
	armorname = {"modular-armor","power-armor","power-armor-mk2","bob-power-armor-mk3","bob-power-armor-mk4","bob-power-armor-mk5","yi_armor_gray","yi_armor_red","yi_armor_gold","yi_walker_a","yi_walker_c"}

-- Define variables
	robotmult = 0
	robots = 0
	powertype = 1
	batterytype = 1
	roboporttype = 1
	energyshieldtype = 1
	noarmor = false
	beltimmunityplaced = false
	nightvisionplaced = false
	inbackpack = false

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
	else
		noarmor = true
	end

-- Give armor
	if not noarmor then
		created_items[armorname[armortype]] = 1
	end
end




-- Insert in grid function
function gridput(eqname, gridcol, gridrow)
	grid.put({name = eqname, position = {gridcol,gridrow}})
end




-- Insert in inventory function
function inventory(pname, pamount)
	created_items[pname]=(created_items[pname] or 0) + pamount
end
-- Give armor and equipment
	if uqsbne then
		getarmor(created_items)
	end

-- Give belt and stuff to player
	getstuff(created_items)

    remote.call("freeplay", "set_created_items", created_items)
end)




