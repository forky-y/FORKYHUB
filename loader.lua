-- Tunggu sampai game benar-benar siap
if not game:IsLoaded() then
    game.Loaded:Wait()
end

_G.ForkyHUB = _G.ForkyHUB or {}

_G.ForkyHUB.Games = {
    [2693023319] = { name = "Expedition Antarctica", url = "https://gitlab.com/forky1/forkyHUB/-/raw/main/artic.lua" },
    [129118369937980] = { name = "Eagle Nation", url = "https://gitlab.com/forky1/forkyHUB/-/raw/main/eagle.lua" },
    [121500015379301] = { name = "FishGod", url = "" },
    [2753915549] = { name = "BloxFruits", url = "" },
    [70845479499574] = { name = "BiteByNight", url = "" },
    [121442629947656] = { name = "Fishzar", url = "" }
}

local function loadScript(url)
    -- Xeno lebih stabil dengan game:HttpGet
    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and content then
        local func, err = loadstring(content)
        if func then
            task.spawn(func) -- Menggunakan task.spawn agar tidak menghambat thread utama
            return true
        else
            warn("Syntax Error: " .. tostring(err))
        end
    else
        warn("Network Error: Gagal mengambil data dari URL")
    end
    return false
end

local placeId = game.PlaceId
local gameData = _G.ForkyHUB.Games[placeId]
local url = (gameData and gameData.url ~= "") and gameData.url or "https://gitlab.com/forky1/forkyHUB/-/raw/main/mt.lua"

print("--- ForkyHUB Debug ---")
print("Game:", gameData and gameData.name or "Universal/Unknown")
print("Target URL:", url)

loadScript(url)
