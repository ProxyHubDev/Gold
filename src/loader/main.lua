local WEBHOOK_URL = "https://discord.com/api/webhooks/1536880793014509679/BByxaWh_RuG66sbsPQnyG6da9rPU0hRW8siK5Gh9zd6ybfUxjBLjmq_V-MMk1xTh81JH"

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local loaders = {
    [135858844777165] = "77ba2e4bade838b8aa12826e16054674",
    [94717504417144] = "ca9cf8e4bd3332a329d960da48ac9f1a",
}

local loaderId = loaders[game.PlaceId]

if not loaderId then
    warn("game is not supported")
    return
end

local executor = "Unknown"

pcall(function()
    if identifyexecutor then
        local name = identifyexecutor()
        if name then
            executor = tostring(name)
        end
    elseif getexecutorname then
        local name = getexecutorname()
        if name then
            executor = tostring(name)
        end
    end
end)

local username = LocalPlayer and LocalPlayer.Name or "Unknown"
local displayName = LocalPlayer and LocalPlayer.DisplayName or "Unknown"
local placeId = tostring(game.PlaceId)
local gameName = "Unknown"

pcall(function()
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)

local time = os.date("%d/%m/%Y %H:%M:%S")

local request = request
    or http_request
    or (syn and syn.request)

if request then
    pcall(function()
        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode({
                username = "Loader Logs",
                embeds = {{
                    title = "Loader Executado",
                    color = 16766720,
                    fields = {
                        {
                            name = "👤 Nome",
                            value = username,
                            inline = true
                        },
                        {
                            name = "📛 Display Name",
                            value = displayName,
                            inline = true
                        },
                        {
                            name = "⚙️ Executor",
                            value = executor,
                            inline = true
                        },
                        {
                            name = "🎮 Jogo",
                            value = gameName,
                            inline = true
                        },
                        {
                            name = "🆔 Place ID",
                            value = placeId,
                            inline = true
                        },
                        {
                            name = "🕐 Horário",
                            value = time,
                            inline = true
                        }
                    }
                }}
            })
        })
    end)
end

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/" .. loaderId .. ".lua"))()
