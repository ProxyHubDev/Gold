local loaders = {
    [135858844777165] = "77ba2e4bade838b8aa12826e16054674", -- Anime Duelist
    [94717504417144] = "ca9cf8e4bd3332a329d960da48ac9f1a", -- Anime Capture
}

local loaderId = loaders[game.PlaceId]

if not loaderId then
    warn("game is not supported")
    return
end

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/" .. loaderId .. ".lua"))()
