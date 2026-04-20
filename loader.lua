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

local function safeLoad(url)
    local maxRetries = 3
    local content = nil
    
    for i = 1, maxRetries do
        print("Mencoba memuat script (Percobaan ke-" .. i .. ")...")
        local success, res = pcall(function()
            return game:HttpGet(url)
        end)
        
        if success and res and #res > 0 then
            content = res
            break
        end
        task.wait(1)
    end

    if content then
        local func, err = loadstring(content)
        if func then
            print("Berhasil! Menjalankan ForkyHUB...")
            task.spawn(func)
        else
            warn("Script bermasalah (Syntax Error): " .. tostring(err))
        end
    else
        warn("Gagal total: Cek koneksi atau link!")
    end
end

local placeId = game.PlaceId
local gameData = _G.ForkyHUB.Games[placeId]
local targetUrl = (gameData and gameData.url ~= "") and gameData.url or "https://gitlab.com/forky1/forkyHUB/-/raw/main/mt.lua"

safeLoad(targetUrl)
