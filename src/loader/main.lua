local Loaders = {
    [94717504417144] = function()
        loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6f41d36a79b4b144394beff23b6e3433cb6a72e9629d4f72f2dceb2cbbec49c1/download"))()
    end,

    [135858844777165] = function()
        loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/4e04c52a2de9e4f203a6148796e6f4c3ef029951f1cb10e8a17cf5be29f0c9e2/download"))()
    end
}

local Loader = Loaders[game.PlaceId]

if Loader then
    Loader()
end
