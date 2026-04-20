repeat task.wait() until game:IsLoaded()

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

function _G.ForkyHUB.Load(url)
    return loadstring(game:HttpGet(url))()
end

local gameData = _G.ForkyHUB.Games[game.PlaceId]

local url = gameData and gameData.url
    or "https://gitlab.com/forky1/forkyHUB/-/raw/main/main.lua"

_G.ForkyHUB.Load(url)
