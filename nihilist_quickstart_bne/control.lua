-- luacheck: globals nqs_bne script defines game settings

nqs_bne = storage.nqs_bne or {}
nqs_bne.setupFuncs = {}

for _, setup_step in pairs({ "bots", "equipment", "weapons", "custom" }) do
	require("core/setup/" .. setup_step)
end
local execute = require("core/execution")

local function quickstart_bne(e)
	nqs_bne.initInfo = nqs_bne.initInfo or {}
	if nqs_bne.initInfo[e.player_index] then
		return
	end

	local player = game.players[e.player_index]
	if player.controller_type == defines.controllers.character then
		for _, func in ipairs(nqs_bne.setupFuncs) do
			func()
		end

		execute(player)

		nqs_bne.initInfo = nqs_bne.initInfo or {}
		nqs_bne.initInfo[e.player_index] = true
		nqs_bne.setupFuncs = nil
		storage.nqs_bne = nqs_bne
	end
end
script.on_event(defines.events.on_player_created, quickstart_bne)
script.on_event(defines.events.on_cutscene_cancelled, quickstart_bne)
