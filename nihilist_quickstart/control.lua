-- luacheck: globals global nqs script defines game setting
nqs = global.nqs or {}
nqs.setupFuncs = {}

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

for _, setup_step in pairs({ "logistic", "production", "power", "military", "misc" }) do
    require("core/setup/" .. setup_step)
end
local execute = require("core/execution")

local function quickstart(e)
    nqs.initInfo = nqs.initInfo or {}
    if nqs.initInfo[e.player_index] then return end

    local player = game.players[e.player_index]
    if player.controller_type == defines.controllers.character then
        for _, func in ipairs(nqs.setupFuncs) do
            func()
        end

        execute()

        for _, info in pairs(nqs.insertion_info) do
            if info.count > 0 then player.insert(info) end
            -- Hack to provide the first stacking technology if beltboxes are added so they are useable
            if string.find(info.name, "beltbox") then
                player.force.technologies["deadlock-stacking-1"].researched = true
            end
        end
        nqs.initInfo = nqs.initInfo or {}
        nqs.initInfo[e.player_index] = true
        nqs.setupFuncs = nil
        global.nqs = nqs
    end
end
script.on_event(defines.events.on_player_created, quickstart)
script.on_event(defines.events.on_cutscene_cancelled, quickstart)
