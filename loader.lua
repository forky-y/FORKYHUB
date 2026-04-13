repeat task.wait() until game:IsLoaded()

_G.ForkyHUB = _G.ForkyHUB or {}

_G.ForkyHUB.Games = {
    [131623223084840] = {
        name = "Escape Tsunami",
        url = ""
    },
    [130342654546662] = {
        name = "Sambung Kata",
        url = ""
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
    or "https://raw.githubusercontent.com/forkysementara/UI/refs/heads/main/run/forky.lua"

_G.ForkyHUB.Load(url)
