local Loaders = {
    [135858844777165] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProxyHubDev/Gold/refs/heads/main/src/scripts/animeduelists.lua"))()
    end
}

local Loader = Loaders[game.PlaceId]

if Loader then
    Loader()
end
