-- luacheck: globals NQS_Init NQS_State script defines game settings
NQS_State = {}
NQS_SetupFuncs = {}

-- Variables
require("mods/aai-industry")
require("mods/angelsrefining")
require("mods/angelssmelting")
require("mods/omnimatter")
require("mods/omnimatter_fluid")
require("mods/boblogistics")
require("mods/pycoalprocessing")
require("mods/pyrawores")
require("mods/pyindustry")
require("mods/deadlock-beltboxes-loaders")
require("mods/thermal-solar-power")
require("mods/vanilla-loaders-hd")
require("mods/miniloaders")
require("mods/market2")
require("mods/oxygen")
require("mods/electricboiler")
require("mods/mini-machines")
require("mods/electric_furnaces")
require("mods/krastorio2")
require("mods/linked_belts")

require("core/setup")

local function quickstart(e)
	if NQS_Init and NQS_Init[e.player_index] then
		return
	end

	local player = game.players[e.player_index]
	if (player.controller_type == defines.controllers.character) then
		for _, func in ipairs(NQS_SetupFuncs) do
			func()
		end

		log(serpent.block(NQS_State))

		-- Armor generation
		function nqs_util_inventory(pname, pamount)
			player.insert {name = pname, count = pamount}
		end

		-- Give belt and stuff to player
		-- Inserting inserters
		if NQS_State.inserternumber and NQS_State.inserternumber > 0 then
			nqs_util_inventory(NQS_State.insertertype, NQS_State.inserternumber)
		end

		-- Inserting belts
		if NQS_State.beltnumber and NQS_State.beltnumber > 0 then
			nqs_util_inventory(NQS_State.belttype, NQS_State.beltnumber)
		end

		-- Inserting undergrounds
		if NQS_State.undergroundnumber and NQS_State.undergroundnumber > 0 then
			nqs_util_inventory(NQS_State.undergroundtype, NQS_State.undergroundnumber)
		end

		-- Inserting splitters
		if NQS_State.splitternumber and NQS_State.splitternumber > 0 then
			nqs_util_inventory(NQS_State.splittertype, NQS_State.splitternumber)
		end

		-- Inserting loaders
		if NQS_State.loadernumber and NQS_State.loadernumber > 0 then
			nqs_util_inventory(NQS_State.loadertype, NQS_State.loadernumber)
		end

		-- Inserting beltboxes
		if NQS_State.beltboxnumber and NQS_State.beltboxnumber > 0 then
			nqs_util_inventory(NQS_State.beltboxtype, NQS_State.beltboxnumber)
		end

		-- Inserting pipes
		if NQS_State.pipenumber and NQS_State.pipenumber > 0 then
			nqs_util_inventory(NQS_State.pipetype, NQS_State.pipenumber)
		end

		-- Inserting pipe-to-grounds
		if NQS_State.pipeundergroundnumber and NQS_State.pipeundergroundnumber > 0 then
			nqs_util_inventory(NQS_State.pipeundergroundtype, NQS_State.pipeundergroundnumber)
		end

		-- Inserting mining drills
		if NQS_State.minernumber and NQS_State.minernumber > 0 then
			nqs_util_inventory(NQS_State.minertype, NQS_State.minernumber)
		end

		-- Inserting mining drones
		if NQS_State.minernumber2 and NQS_State.minernumber2 > 0 and NQS_State.miningdrones then
			nqs_util_inventory(NQS_State.minertype2, NQS_State.minernumber2)
		end

		-- Inserting labs
		if NQS_State.labnumber and NQS_State.labnumber > 0 then
			nqs_util_inventory(NQS_State.labtype, NQS_State.labnumber)
		end

		-- Inserting assembling machines
		if NQS_State.assemblernumber and NQS_State.assemblernumber > 0 then
			nqs_util_inventory(NQS_State.assemblertype, NQS_State.assemblernumber)
		end

		-- Inserting power poles
		if NQS_State.polenumber and NQS_State.polenumber > 0 then
			nqs_util_inventory(NQS_State.poletype, NQS_State.polenumber)
		end

		-- Inserting Omnitractors
		if NQS_State.Omnimatter and NQS_State.omnitractornumber and NQS_State.omnitractornumber > 0 then
			nqs_util_inventory(NQS_State.omnitractortype, NQS_State.omnitractornumber)
		end

		-- Inserting furnaces
		if NQS_State.furnacenumber and NQS_State.furnacenumber > 0 then
			nqs_util_inventory(NQS_State.furnacetype, NQS_State.furnacenumber)
		end

		if NQS_State.linkedbeltnumber and NQS_State.linkedbeltnumber > 0 then
			nqs_util_inventory("linked-belt", NQS_State.linkedbeltnumber)
		end

		-- Inserting Market stuff
		if NQS_State.marketmod then
			if NQS_State.marketchestsnumber and NQS_State.marketchestsnumber > 0 then
				nqs_util_inventory(NQS_State.marketcheststype, NQS_State.marketchestsnumber)
			end
			if NQS_State.markettanksnumber and NQS_State.markettanksnumber > 0 then
				nqs_util_inventory(NQS_State.markettankstype, NQS_State.markettanksnumber)
			end
			if NQS_State.marketaccumulatorsnumber and NQS_State.marketaccumulatorsnumber > 0 then
				nqs_util_inventory(NQS_State.marketaccumulatorstype, NQS_State.marketaccumulatorsnumber)
			end
		end

		-- Inserting oxygen stuff
		if NQS_State.oxygenmod then
			if NQS_State.oxygenbottlesnumber and NQS_State.oxygenbottlesnumber > 0 then
				nqs_util_inventory(NQS_State.oxygenbottlestype, NQS_State.oxygenbottlesnumber)
			end
		end

		-- Water for power in omnimatter
		if NQS_State.Omnimatter and NQS_State.needwater then
			nqs_util_inventory("omniphlog-1", NQS_State.numberofwater)
			nqs_util_inventory("omnitractor-1", NQS_State.numberofwater)
		end

		if NQS_State.crushertype and NQS_State.crushernumber then
			nqs_util_inventory(NQS_State.crushertype, NQS_State.crushernumber)
		end
		if NQS_State.sorternumber and NQS_State.sorternumber > 0 then
			nqs_util_inventory("ore-sorting-facility", NQS_State.sorternumber)
		end
		if NQS_State.ifurnacenumber and NQS_State.ifurnacenumber > 0 then
			nqs_util_inventory("induction-furnace", NQS_State.ifurnacenumber)
		end
		if NQS_State.bfurnacenumber and NQS_State.bfurnacenumber > 0 then
			nqs_util_inventory("blast-furnace", NQS_State.bfurnacenumber)
		end
		if NQS_State.cmachineenumber and NQS_State.cmachinenumber > 0 then
			nqs_util_inventory("casting-machine", NQS_State.cmachinenumber)
		end
		if NQS_State.chestnumber > 0 then
			nqs_util_inventory("wooden-chest", NQS_State.chestnumber)
		end

		if NQS_State.fuelnumber > 0 then
			nqs_util_inventory(NQS_State.fueltype, NQS_State.fuelnumber)
		end

		if NQS_State.pyCoal then
			if NQS_State.plantationsnumber > 0 then
				nqs_util_inventory("fawogae-plantation", NQS_State.plantationsnumber)
			end
			if NQS_State.distilatorsnumber > 0 then
				nqs_util_inventory("distilator", NQS_State.distilatorsnumber)
			end
			if NQS_State.pondsnumber > 0 then
				nqs_util_inventory("tailings-pond", NQS_State.pondsnumber)
			end
			if NQS_State.pyIndustry then
				if NQS_State.gasventsnumber > 0 then
					nqs_util_inventory("py-gas-vent", NQS_State.gasventsnumber)
				end
			else
				if NQS_State.pondsnumber > 0 then
					nqs_util_inventory("tailings-pond", 1)
				end
			end
			nqs_util_inventory("offshore-pump", 1)
			if NQS_State.pyOres then
				if NQS_State.crystalminesnumber > 0 then
					nqs_util_inventory("borax-mine", NQS_State.crystalminesnumber)
				end
			end
		end
		-- Checking settings for defensive structures
		local gunturretnumber = NQS_State.gunturretnumber
		local gunturretammotype = NQS_State.gunturretammotype
		local gunturretammonumber = NQS_State.gunturretammonumber

		if gunturretnumber > 0 then
			nqs_util_inventory("gun-turret", gunturretnumber)
			if gunturretammonumber > 0 then
				nqs_util_inventory(gunturretammotype, gunturretammonumber)
			end
		end
		if NQS_State.stonewallnumber > 0 then
			nqs_util_inventory("stone-wall", NQS_State.stonewallnumber)
		end
		if NQS_State.gatenumber > 0 then
			nqs_util_inventory("gate", NQS_State.gatenumber)
		end

		for _, v in pairs(NQS_State.power_setup_info) do
			nqs_util_inventory(v[1], v[2])
		end

		NQS_Init = NQS_Init or {}
		NQS_Init[e.player_index] = true
	end
end
script.on_event(defines.events.on_player_created, quickstart)
script.on_event(defines.events.on_cutscene_cancelled, quickstart)
