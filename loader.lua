-- Fixed for Xeno Executor
repeat task.wait() until game.Loaded == true

_G.ForkyHUB = _G.ForkyHUB or {}

_G.ForkyHUB.Games = {
    [2693023319] = {
        name = "Expedition Antarctica",
        url = "https://gitlab.com/forky1/forkyHUB/-/raw/main/artic.lua"
    },
    [129118369937980] = {
        name = "Eagle Nation",
        url = "https://gitlab.com/forky1/forkyHUB/-/raw/main/eagle.lua"
    },
    [121500015379301] = {
        name = "FishGod",
        url = ""
    },
    [2753915549] = {
        name = "BloxFruits",
        url = ""
    },
    [70845479499574] = {
        name = "BiteByNight",
        url = ""
    },
    [121442629947656] = {
        name = "Fishzar",
        url = ""
    }
}

-- Fixed load function for Xeno
local function loadScript(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGetAsync(url, true))()
    end)
    
    if not success then
        warn("Failed to load script: " .. tostring(result))
        return false
    end
    return true
end

local gameData = _G.ForkyHUB.Games[game.PlaceId]
local url = gameData and gameData.url ~= "" and gameData.url 
    or "https://gitlab.com/forky1/forkyHUB/-/raw/main/mt.lua"

print("Loading ForkyHUB for:", gameData and gameData.name or "Unknown Game")
print("URL:", url)

loadScript(url)
